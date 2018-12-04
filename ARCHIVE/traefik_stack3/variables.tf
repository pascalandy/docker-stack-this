variable "region" {}
variable "keyname" {}
variable "private_key" {}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-8c1be5f6"
    "eu-west-2" = "ami-1a7f6d7e"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}
