provider "aws" {
  alias             = "virginia"
  region     = var.virginia_region
  access_key = var.access_key
  secret_key = var.secret_key
}
