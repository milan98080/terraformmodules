terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "webhost" {
    source = "./modules/workflows/webhost"
    domain = "letslearnify.me"
    source_path = "/home/milan/Documents/Leapfrog/FullStackToDo/frontend/dist"
}