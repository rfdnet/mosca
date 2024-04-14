provider "aws" {
  region = "us-west-2"


}



terraform {
  backend "s3" {
    bucket = "mosca-tf-state"
    key    = "mosca-remote-state-dev"
    region = "us-west-2"
  }
}
