terraform {
  required_providers {
    aws = {
      source  = "hashicorp/google"
      version = "> 3.5.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "google" {

  
  region  = var.region
  project = var.project
}
