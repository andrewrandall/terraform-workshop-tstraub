resource "azurerm_resource_group" "main" {
	name		= "ar-portal-rg"
	location	= "centralus"
	tags {
		terraform = "true"
	}
}

resource "azurerm_storage_account" "main" {
	name				= "archall1storage"
	resource_group_name		= "${azurerm_resource_group.main.name}"
	location			= "centralus"
	account_tier			= "Standard"
	account_replication_type	= "LRS"
	tags {
		terraform = "true"
	}
}
