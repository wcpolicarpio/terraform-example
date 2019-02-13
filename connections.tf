  provider "google" {
    credentials = "${file("../google-terraform.json")}"
    project = "myterraform-231422"
    region = "us-west1"
  }

  provider "aws" {
  region = "ca-central-1"
  }

