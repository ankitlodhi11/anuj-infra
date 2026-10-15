output "resource_group_id" {
  value = module.resource_group.id
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_id" {
  value = module.networking.subnet_id
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}