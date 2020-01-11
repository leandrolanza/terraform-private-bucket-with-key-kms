data "aws_iam_policy_document" "this" {
    statement {
        sid        = "AccountAccess"
        effect     = "Allow"
        actions    = ["kms:*"]
        resources  = ["*"]

        principals = [
            {
                type        = "AWS"
                identifiers = ["arn:aws:iam::${join("", data.aws_caller_identity.this.*.account_id)}:root"]
            }
        ]
    }
    statement {
        sid        = "AppDecryptions"
        effect     = "Allow"
        actions    = ["kms:*"]
        resources  = ["*"]

        principals = [
            {
                type        = "AWS"
                identifiers = ["*"]
            }
        ]
    }
}
