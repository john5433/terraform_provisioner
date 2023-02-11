data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "john5433.student08-bucket"
    key    = "john5433-network-state"
    region = "us-west-2"
  }
}

resource "aws_instance" "my_vm" {
  ami                    = var.ami
  subnet_id              = data.terraform_remote_state.network_details.outputs.my_subnet
  instance_type          = var.instance_type
  tags = var.ec2_tags
}

