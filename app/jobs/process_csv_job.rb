class ProcessCsvJob < ActiveJob::Base
  def perform(data)
    puts "----------> data is: #{data.inspect}"
    Shrine::Attacher.promote(data)
    
    # do processing here?
    
    
  end
end