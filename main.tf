provider "aws" {
    alias   = "production"
    profile = "default"
    region  = "us-east-1"
}

module "secure-s3" {
  source              = "./modules/secure-s3"
  bucket_name         = "bucket-name"
  kms_key_name        = "kms-name"
  kms_key_description = "kms-description"
}