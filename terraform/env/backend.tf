terraform {
  backend "local" {
    path = "../backend/test.tfstate"
  }
}