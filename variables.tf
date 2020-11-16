variable "region_name" {
  type        = string
  default     = "us-west-2"
  description = "AWS region for builds"
}

variable "aws_ami" {
  type        = string
  default     = "ami-07dd19a7900a1f049"
  description = "US west ami for builds"
}
