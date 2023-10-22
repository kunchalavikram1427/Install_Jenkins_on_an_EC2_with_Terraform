variable "region" {
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-03eb6185d756497f8"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}