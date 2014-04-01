require 'rubygems'
require 'aws-sdk'
 require 'nokogiri'
module Access
  KEY = 'AKIAINXHMBXIPB4STG5Q'
  SECRET_KEY = '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'
  REGION = 'us-west-2'
  BUCKET_NAME = "PracticeSession"
end

class Uploader
  include Access
   attr_accessor :file, :file_name_in_bucket, :bucket_name

   def initialize(options={})

     @file_name_in_bucket = options[:file_name] 
     @file = File.open(options[:path])
     @bucket_name = options[:bucket_name] || BUCKET_NAME

     h = {
       :aws_access_key_id => KEY,
       :aws_secret_access_key => SECRET_KEY
     }
     AWS.config(
       :access_key_id => 'AKIAINXHMBXIPB4STG5Q', 
       :secret_access_key => '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'
     )
     s3 = AWS::S3.new
     bucket_name = @bucket_name
     file_name = @file
    
     s3.buckets[bucket_name].objects[@file_name_in_bucket].write(:file => @file)
   end

end