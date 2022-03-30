terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "> 3.53"
    }
  }

  required_version = ">= 0.14.9"

  backend "gcs" {
    credentials = "esparta86project-col886.json"
    bucket      = "tf-states-cicd"
    prefix      = "terraform/state"
  }
}

provider "google" {

  credentials = file("esparta86project-col886.json")
  region      = var.region
  project     = var.project
}


