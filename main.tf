module "aws" {
  source = "./modules/aws"
}

module "identity" {
  source = "./modules/identity"
  role_name = "my-identity-role"
  policy_name = "my-identity-policy"
  dynamodb_table_arn = module.storage.dynamodb_table_arn  # Reference to the storage module
}

module "storage" {
  source = "./modules/storage"
}

module "compute" {
  source = "./modules/compute"
}

output "identity_role_arn" {
  value = module.identity.identity_role_arn
}

output "identity_policy_arn" {
  value = module.identity.identity_policy_arn
}
