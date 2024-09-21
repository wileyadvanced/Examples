provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-west-2"
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# Identity Service
module "identity_service" {
  source = "./modules/identity_service"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Storage Service
module "storage_service" {
  source = "./modules/storage_service"
  storage_account_name = var.storage_account_name
  location            = var.location
}

# Event Bus Service
module "eventbus_service" {
  source = "./modules/eventbus_service"
  eventbus_name = var.eventbus_name
  location      = var.location
}

# Observability Service
module "observability_service" {
  source = "./modules/observability_service"
  monitoring_tool = var.monitoring_tool
}

# API Service
module "api_service" {
  source = "./modules/API_service"
  api_name = var.api_name
  location = var.location
}

# AI Service
module "ai_service" {
  source = "./modules/AI_service"
  model_name = var.model_name
  location   = var.location
}

# Private Cloud
module "private_cloud" {
  source = "./modules/private_cloud"
  cloud_name = var.private_cloud_name
}

# Azure Compute
module "azure_compute" {
  source = "./modules/azure_compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_size             = var.vm_size
}

# AWS Compute
module "aws_compute" {
  source = "./modules/aws_compute"
  instance_type = var.aws_instance_type
  ami           = var.aws_ami
}

# GCP Compute
module "gcp_compute" {
  source = "./modules/gcp_compute"
  machine_type = var.gcp_machine_type
  zone         = var.gcp_zone
}

# Legacy Customer Module
module "legacy_customer" {
  source = "./modules/legacy_customer"
  customer_id = var.customer_id
}

# Outputs
output "identity_service_output" {
  value = module.identity_service.output_value
}

output "storage_service_output" {
  value = module.storage_service.output_value
}

output "eventbus_service_output" {
  value = module.eventbus_service.output_value
}

output "observability_service_output" {
  value = module.observability_service.output_value
}

output "api_service_output" {
  value = module.api_service.output_value
}

output "ai_service_output" {
  value = module.ai_service.output_value
}

output "azure_compute_output" {
  value = module.azure_compute.output_value
}

output "aws_compute_output" {
  value = module.aws_compute.output_value
}

output "gcp_compute_output" {
  value = module.gcp_compute.output_value
}

output "legacy_customer_output" {
  value = module.legacy_customer.output_value
}
