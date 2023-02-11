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
  key_name               = data.terraform_remote_state.network_details.outputs.key_name
  vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
  instance_type          = var.instance_type
  tags                   = var.ec2_tags
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/ubuntu/terraform_base/keys/john.07")
      host        = self.public_ip
    }
  }
}



