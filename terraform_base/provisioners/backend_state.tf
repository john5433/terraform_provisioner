terraform {
  backend "s3" {
    bucket = "john5433.student08-bucket"
    key    = "john5433-instance-state"
    region = "us-west-2"
  }
}

