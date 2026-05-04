terraform {
  required_providers {
    signalfx = {
      source  = "splunk-terraform/signalfx"
      version = "~> 9.0"
    }
  }
}

provider "signalfx" {
  auth_token = var.signalfx_token
  api_url    = "https://api.us1.signalfx.com"
}