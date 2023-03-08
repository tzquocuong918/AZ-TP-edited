# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.19.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id   = "3f87c349-6fa2-455b-bd5b-1222f6d15367"
  tenant_id         = "037f8e6b-2776-49f6-bd0f-234af6a8030b"
  client_id         = "17d948e8-5a27-499f-a64c-ca6481ec5439"
  client_secret     = "kSe8Q~aH.~E4En0gmX2NxQ13_7oFJ7SX-w-kGbUk"
}


data "azurerm_client_config" "core" {}

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.2.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }


  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources

}