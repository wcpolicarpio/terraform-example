  provider "google" {
    credentials = "${file("../google-terraform.json")}"
    project = "myterraform-231422"
    region = "us-west1"
  }

  provider "aws" {
  region = "us-west-1c"
  }

