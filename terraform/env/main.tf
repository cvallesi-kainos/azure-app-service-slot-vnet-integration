module "base" {
    source = "../modules/base"

    prefix              = var.prefix
    resource_group_name = local.resource_group_name
}

module "network" {
    source = "../modules/network"

    prefix              = var.prefix
    resource_group_name = local.resource_group_name
    
    depends_on = [
      module.base
    ]
}

module "app-service" {
    source = "../modules/app-service"

    prefix              = var.prefix
    resource_group_name = local.resource_group_name
    app_service_name    = local.app_service_name
    network_name        = module.network.network_name
    subnet_name         = module.network.subnetwork_name
    subnetwork_rg       = module.network.subnetwork_rg
    
    depends_on = [
      module.network,
      module.base
    ]
}

output "base" {
    value   = module.base
}

output "network" {
  value     = module.network
}

output "app-service" {
    value   = module.app-service
}
