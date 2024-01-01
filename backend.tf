terraform {
  backend "remote" {
    organization = "a-mymt-terraform"

    workspaces {
      name = "training"
    }
  }
}