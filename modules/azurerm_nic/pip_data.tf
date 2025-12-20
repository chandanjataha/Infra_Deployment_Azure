data "azurerm_public_ip" "az-pip" {
  for_each            = var.pip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}



