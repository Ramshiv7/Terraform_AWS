provider "aws" {

    region                   = "us-east-1"
    shared_config_files      = ["$HOME/.aws/config"]
    shared_credentials_files = ["$HOME/.aws/credentials"]

}

# Create a S3 Bucket 
resource "aws_s3_bucket" "mybucks" {
    bucket = "ramshiv-buks-wicket-out"

}

# Upload files to S3 Bucket 
resource "aws_s3_object" "provision_source_files" {
    bucket  = aws_s3_bucket.mybucks.id
    
    # myapp/ is the Directory contains files to be uploaded to S3
    for_each = fileset("myapp/", "**/*.*") 
    
    key    = each.value
    source = "myapp/${each.value}"
    content_type = each.value
}