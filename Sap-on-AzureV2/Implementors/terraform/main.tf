terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_id" "id" {
  byte_length = 8
}

#######################################################################
## Create Resource Group
#######################################################################

resource "azurerm_resource_group" "rg" {
  name     = "microhack-rg-[Deployment_ID]"       ## Make sure replace Deployment_ID
  location = var.location
  tags     = var.tags
}

#######################################################################
## Assign Storage Role to User
#######################################################################

data "external" "azaccount" {
  program = ["az","ad","signed-in-user","show","--query","{displayName: displayName,objectId: id}"]
}

data "azurerm_client_config" "user" {
}

locals {
  object_id = data.azurerm_client_config.user.object_id == "" ? data.external.azaccount.result.objectId : data.azurerm_client_config.user.object_id
}

resource "azurerm_role_assignment" "storagerole" {
  scope                 = azurerm_resource_group.rg.id
  role_definition_name  = "Storage Blob Data Contributor"
  principal_id          = "[ADD USER OBJECT_ID]"     ## Make sure to replace the provided User Object_ID
}

#######################################################################
## Create Key Vault
#######################################################################

resource "azurerm_key_vault" "keyvault" {
  name                  = "sapkv${lower(random_id.id.hex)}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  tenant_id             = data.azurerm_client_config.user.tenant_id
  sku_name              = "standard"
  tags                  = var.tags

  access_policy {
    tenant_id = data.azurerm_client_config.user.tenant_id
    object_id = "[ADD USER OBJECT_ID]"      ## Make sure to replace the provided User Object_ID

    key_permissions = [
      "Create",
      "Get",
      "Purge",
      "List",
      "Delete"
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]
  }
}

#######################################################################
## Add secret to Key Vault
#######################################################################

resource "azurerm_key_vault_secret" "secret" {
  name         = var.username
  value        = var.password
  key_vault_id = azurerm_key_vault.keyvault.id
}
