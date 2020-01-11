resource "aws_s3_bucket" "this" {
    bucket        = "${var.bucket_name}"
    acl           = "${var.acl}"
    force_destroy = true
    versioning {
        enabled = true
    }
    lifecycle_rule {
        id      = "transition-${var.bucket_name}"
        enabled = true
        transition {
            days          = 30
            storage_class = "ONEZONE_IA"
        }
        transition {
            days          = 60
            storage_class = "GLACIER"
        }
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = ""
                sse_algorithm     = "aws:kms"
            }
        }
    }
}

resource "aws_s3_bucket_policy" "this" {
    bucket = "${aws_s3_bucket.this.id}"
    policy = "${data.aws_iam_policy_document.this.json}"
}
