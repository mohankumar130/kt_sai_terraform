terraform {
  backend "s3" {
    bucket         = "ckterraforms3"
    key            = "ck-dev-env.tfstate"
    dynamodb_table = "demotesting"
    region         = "us-east-1"
    profile        = "hometerraform"
  }
}