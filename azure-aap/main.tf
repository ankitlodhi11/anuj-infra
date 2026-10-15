module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source = "./modules/networking"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix

  depends_on = [module.resource_group]
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  storage_account_name = var.storage_account_name
  tags                 = var.tags
}
