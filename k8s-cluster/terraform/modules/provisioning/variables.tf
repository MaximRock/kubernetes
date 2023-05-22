# variable provisioning

variable "ssh_credentials" {
  description = "Credentials for connect to instances"
  type = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default = {
    user        = "admin"
    private_key = "C:\\Users\\User\\.ssh\\id_ed25519"
    pub_key     = "C:\\Users\\User\\.ssh\\id_ed25519.pub"
  }
}

variable "hostname_srv_instans" {
  type        = string
  description = "Host instans srv"
}
