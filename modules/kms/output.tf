output "kms" {
  value = {
      arn    = "${aws_kms_key.this.*.arn}"
      key_id = "${aws_kms_key.this.*.key_id}"
  }
}
