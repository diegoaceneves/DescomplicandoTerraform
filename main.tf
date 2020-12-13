provider "aws"{
    region = "${terraform.workspace == "production" ? "us-east-1" : "us-west-2"}"
}

terraform {
    backend "s3" {
        bucket          = "descomplicando-terraform-diegoaceneves"
        dynamodb_table  = "terraform-state-lock-dynamo"
        key             = "terraform-test.tfstate"
        encryption      = true
        region          = "us-east-1"
    }
}