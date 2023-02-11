data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "john5433.student08-bucket"
    key    = "john5433-network-state"
    region = "us-west-2"
  }
}

