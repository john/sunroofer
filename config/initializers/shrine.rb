require "shrine/storage/s3"

s3_options = {
  access_key_id:      ENV['S3_KEY'],
  secret_access_key:  ENV['S3_SECRET'],
  region:             ENV['S3_REGION'],
  bucket:             ENV['S3_BUCKET'],
}
Shrine.plugin :activerecord
Shrine.plugin :validation_helpers
# Shrine.plugin :cached_attachment_data # for forms
# Shrine.plugin :backgrounding
# Shrine.plugin :logging, logger: Rails.logger
 
Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
  # store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
  store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options)
}


# Moved to specific uploader class
# Shrine::Attacher.promote { |data| PromoteJob.perform_later(data) }