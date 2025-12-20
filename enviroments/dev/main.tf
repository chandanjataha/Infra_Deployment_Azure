module "md-rg"{
    source = "../../modules/azurerm_resource_group"
    rg = var.prg
}
module "md-virtual_network"{
    depends_on = [ module.md-rg ]
    source = "../../modules/azurerm_network"
    vnet = var.pvnet

}
module "md-subnet" {
    depends_on = [ module.md-virtual_network ]
    source = "../../modules/azurerm_subnet"
    subnet = var.psubnet
} 

module "md-public_ip" {
    depends_on = [ module.md-rg ]
    source = "../../modules/azurerm_public_ip"
    pip = var.ppip
}

module "md-nic" {
    depends_on = [ module.md-public_ip, module.md-subnet ]
    source = "../../modules/azurerm_nic"
    nic = var.pnic
    pip = var.ppip
    subnet = var.psubnet
}
module "md-stg"{
    depends_on = [ module.md-rg ]
    source = "../../modules/azurerm_storage_account"
    stg = var.pstg
}

module "md-vm" {
    depends_on = [ module.md-nic ]
    source = "../../modules/azurerm_compute"
    vm = var.pvm
    nic  = var.pnic
}