terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      #   version = "2.5.2"
    }
  }
}


provider "linode" {
  token = var.token
}

resource "linode_instance" "windows-server" {
  image           = "linode/ubuntu22.04"
  label           = "windows-server"
  group           = "example"
  region          = var.region
  type            = "g6-standard-4"
  authorized_keys = [var.ssh_key]
  root_pass       = var.vm_password
  stackscript_id  = 1149170
  stackscript_data = {
    "TOKEN"                   = var.token
    "WINDOWS_PASSWORD"        = var.vm_password
    "AUTOLOGIN"               = true
    "W11_ISO_URL"             = "NOURL"
    "INSTALL_WINDOWS_VERSION" = "2k22"
  }

}
