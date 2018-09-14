module "network" {
    source = "Azure/network/azurerm"
    version = "2.0.0"
    resource_group_name = "ar-myapp-networking"
    location = "eastus"

    tags = {
        environment = "dev"
    }
}

module "windowsservers" {
    source = "Azure/compute/azurerm"
    version = "1.1.5"
    resource_group_name = "ar-myapp-compute-windows"
    location = "eastus"
    admin_password = "ComplxP@ssw0rd!"
    vm_os_simple = "WindowsServer"
    nb_public_ip = 0
    vnet_subnet_id = "${module.network.vnet_subnets[0]}"
}