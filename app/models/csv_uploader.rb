class CSVUploader < Shrine
  
  #plugin :cached_attachment_data
  plugin :processing

  Attacher.validate do
      validate_max_size 1.megabyte, message: "is too large (max is 1 MB)"
      validate_mime_type_inclusion ['text/csv']
  end  
  
  # Would be better to do async, but wasn't obvious how to access the file
  # from a job, so just doing inline for now.
  # Attacher.promote { |data| ProcessCsvJob.perform_later(data) }
  # Attacher.delete { |data| DeleteJob.perform_async(data) }
  
  # TODO: make this a method of Building
  def create_sunroof_url(address, city, state, zipcode)
    address = "#{address}, #{city}, #{state} #{zipcode}".gsub(' ', '%20')
    "https://www.google.com/get/sunroof#a=#{address},%20USA&b=90&f=buy&np=14&p=1"
  end
  
  def process(io, context)
    case context[:phase]
    when :store
      CSV.foreach(io.download, :headers => true) do |row|
        school = Building.new
        school.roof_set_id = context[:record].id
        school.name = row[0]
        school.address = row[1]
        school.city = row[2]
        school.state = row[3]
        school.zipcode = row[4]
        school.sunroof_url = create_sunroof_url(row[1], row[2], row[3], row[4])
      
        # school.latitude = roof_info[5][0]
        # school.longitude = roof_info[5][1]
        # school.utility = roof_info[7][2]
        # school.roof_sq_feet = roof_info[7][5]
        # school.sunlight_hours = roof_info[7][6]
        school.save
      end
    end
  end
  
end
