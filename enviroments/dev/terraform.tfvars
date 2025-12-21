prg = {
  rg1 = {
    name     = "rg-103"
    location = "centralindia"
  }
}

pvnet = {
  vnet1 = {
    name                = "vnet-102"
    location            = "centralindia"
    resource_group_name = "rg-103"

  }
}
psubnet = {
  sub1 = {
    name                 = "subnet-101"
    virtual_network_name = "vnet-102"
    resource_group_name  = "rg-103"
    address_prefixes     = ["10.0.2.0/26"]
  }
}
pnic = {
  nic1 = {
    name                = "nic-101"
    location            = "centralindia"
    resource_group_name = "rg-103"
    subnet              = "sub1"
    pip                 = "pip1"

    # ip_configuration {
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    # }

  }
}



ppip = {
  pip1 = {
    name                = "public_ip-101"
    resource_group_name = "rg-103"
    location            = "centralindia"
    allocation_method   = "Static"
     sku               = "Standard"

  }
}

pstg = {
  stg1 = {
    name                     = "azxsdcvfred11"
    resource_group_name      = "rg-103"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}


pvm = {
  vm1 = {
    name                            = "vm-101"
    resource_group_name             = "rg-103"
    location                        = "centralindia"
    size                            = "Standard_D2ls_v6"
    admin_username                  = "adminuser"
    admin_password                  = "Passowrd@123" # not recomended in production
    disable_password_authentication = "false"
    nic                             = "nic1"


    # admin_ssh_key {
    #   username   = "adminuser"
    #   public_key = file("~/.ssh/id_rsa.pub")
    # }

    #os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    #}

    #source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
    #}
  }

}
