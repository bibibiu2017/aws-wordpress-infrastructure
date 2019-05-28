resource "random_id" "suffix" {
  keepers={
    aws_region="${var.aws_region}"
  }

  byte_length=8
}

resource "aws_s3_bucket" "state" {
  bucket="infrastructure-state-${random_id.suffix.hex}"
  acl="private"
  tags={
    Terraform="${var.terraform-name}"
  }
}

output "state_bucket_arn" {
  value = "${aws_s3_bucket.state.arn}"
}
