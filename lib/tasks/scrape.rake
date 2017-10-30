namespace :scrape do
  
  def create_sunroof_url(address, city, state, zipcode)
    address = "#{address}, #{city}, #{state} #{zipcode}".gsub(' ', '%20')
    "https://www.google.com/get/sunroof#a=#{address},%20USA&b=90&f=buy&np=14&p=1"
  end
  
  desc "create roofset"
  task populate_sunroof_url: :environment do
    
    rs = RoofSet.create(name: "roofset_#{Time.now.to_i}")
    
    # open csv
    i = 0
    CSV.foreach("#{Rails.root}/data/sf_schools.csv", :headers => true) do |row|
      school = Building.new
      school.roof_set_id = rs.id
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
      
      i += 1
      break if i > 2
    end
    
    # # loop it
    # # call sunroof, insert address
    # # url = "https://www.google.com/get/sunroof#a=3630%20Divisadero%20St,%20San%20Francisco,%20CA%2094123,%20USA&b=500&f=buy&np=48&p=1"
    #
    # # capture and call xhr request made by page above
    # schools = [{
    #   name: 'Claire Lilienthal Elementary School - Scott Campus'
    #   }, {
    #
    #   }}
    # url = "https://www.google.com/async/sclp?ei=OW_zWeuwDomC0wK1xLuACg&yv=2&async=lat:37.8032774,lng:-122.4433826,pf:se,_fmt:jspb"
    # response = HTTParty.get( url )
    #
    # if response.code == 200
    #   response_string = response.body.gsub(")]}'\n","")
    #   wrapper = JSON.parse(response_string)
    #   roof_info = wrapper['HouseInfoResponse']
    #
    #   school = School.new
    #   school.roof_set_id = rs.id
    #   school.name = 'CL'
    #   school.latitude = roof_info[5][0]
    #   school.longitude = roof_info[5][1]
    #   school.utility = roof_info[7][2]
    #   school.roof_sq_feet = roof_info[7][5]
    #   school.sunlight_hours = roof_info[7][6]
    #   school.save
    # else
    #   puts "Response was #{response.code}, skipping."
    # end
  end
  
end

# https://www.google.com/async/sclp?ei=HnL1Wb6JPOiP0gLmioPgCQ&yv=2&async=lat:37.82495959999999,lng:-122.36914030000003,pf:se,_fmt:jspb

# https://www.google.com/maps/place/Claire+Lilienthal+Elementary+School+-+Madison+Campus/@37.7871579,-122.460187,17z/data=!3m1!4b1!4m5!3m4!1s0x8085873078c1a743:0x1f3abfc3ec819e98!8m2!3d37.7871537!4d-122.4579983



# testing:
# original url: https://www.google.com/get/sunroof#a=3630%20Divisadero%20St,%20San%20Francisco,%20CA%2094123,%20USA&b=90&f=buy&np=13&p=1
# xhr url = "https://www.google.com/async/sclp?ei=OW_zWeuwDomC0wK1xLuACg&yv=2&async=lat:37.8032774,lng:-122.4433826,pf:se,_fmt:jspb"
# response = HTTParty.get( url )

# response.body.slice!(0,5)

# response_string = response.body.gsub(")]}'\n","")
# wrapper = JSON.parse(data_string)
# roof_info = data['HouseInfoResponse']

# response.body.slice!(0,5)