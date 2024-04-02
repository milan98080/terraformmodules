provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Creator   = "mee.lawn111@gmail.com"
      Project   = "Intern"
      Deletable = "Yes"
    }
  }
}