provider "aws" {
  alias      = "virginia"
  region     = var.virginia_region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "aws" {
  alias      = "spoke_1_vpc"
  region     = var.virginia_region
  access_key = var.access_key
  secret_key = var.secret_key
}