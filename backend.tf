terraform {
  backend "s3" {
    bucket         = "ckterraforms3"
    key            = "ck-dev-env.tfstate"
    use_lockfile   = true
    region         = "us-east-1"
  
  }
}