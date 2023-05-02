# dev/dynamodb/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}


terraform {
  #source = "tfr:///terraform-aws-modules/dynamodb-table/aws//?version=3.5.0"
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table.git//?ref=v3.2.0"
}


inputs = {
  
  create_table = true
  name = "rajatiger-dynamodb"

  hash_key = "userid"
  table_class = "STANDARD"
  
  # # billing_mode   = "PROVISIONED"
  # # create_table= true
  attributes = [
    {
      name = "userid"
      type = "S"
    }
  ]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}