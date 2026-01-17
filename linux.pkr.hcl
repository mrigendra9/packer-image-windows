source "azure-arm" "linux" {

  # -------- Azure Auth --------
  use_azure_cli_auth = true

  # -------- Image Details --------
  managed_image_resource_group_name = "rg-packer-images"
  managed_image_name                = "nginx-app-v1.0.0"

  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"

  location     = "eastus"
  vm_size      = "Standard_DS2_v2"
  ssh_username = "packer"
}

build {
  name    = "linux-nginx-image"
  sources = ["source.azure-arm.linux"]

  provisioner "shell" {
    script = "provisioners/nginx_app.sh"
  }

  provisioner "shell" {
    script = "provisioners/generalize.sh"
  }
}
