variable "ami" {
  default = "ami-04bad3c587fe60d89"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name = "john.07-vm1"
    Environment = "testing"
  }
}

