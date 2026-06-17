#Explicitly defines the local storage parameters for the state track engine.terraform {
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}