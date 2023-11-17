variable "token" {
  description = "Your Linode API Personal Access Token. (required)"
  sensitive   = true
}

variable "region" {
  description = "Linode region"
  sensitive   = false
  default     = "ap-south"
}

variable "ssh_key" {
  description = "Linode VM SSH public key"
  sensitive   = true
}

variable "vm_password" {
  description = "Linode VM SSH password"
  sensitive   = true
}
