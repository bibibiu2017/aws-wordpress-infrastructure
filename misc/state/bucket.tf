resource "random_id" "suffix" {
  keepers={
    aws_region="${var.aws_region}"
  }

  byte_length=8
}

resource "aws_s3_bucket" "state" {
}
