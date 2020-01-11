module "kms" {
  source      = "../kms"
  description = "${var.kms_key_description}"
  name        = "alias/${var.kms_key_name}"
}
