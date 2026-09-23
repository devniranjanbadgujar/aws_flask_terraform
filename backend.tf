terraform {
  backend "s3" {
    bucket       = "terraform-flask-app-state-251120"
    key          = "aws-flask-app/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}