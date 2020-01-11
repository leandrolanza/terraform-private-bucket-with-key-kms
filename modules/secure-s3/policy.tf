data "aws_iam_policy_document" "this" {
    statement {
        sid       = "DenyIncorrectEncryptionHeader"
        effect    = "Deny"
        actions   = ["s3:PutObject"]
        resources = ["${aws_s3_bucket.this.arn}/*"]

        principals = [
            {
                type        = "*"
                identifiers = ["*"]
            },
        ]

        condition = [
            {
                test     = "StringNotEquals"
                variable = "s3:x-amz-server-side-encryption"
                values   = ["aws:kms"]
            },
        ]
    }
}
