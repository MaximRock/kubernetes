# template

resource "local_file" "hosts-ansible" {
  content = templatefile("./hosts.tpl",
    {
      hostname_master_1            = var.hostname_master_1
      external_ip_address_master_1 = var.external_ip_address_master_1
      internal_ip_address_master_1 = var.internal_ip_address_master_1

      hostname_master_2            = var.hostname_master_2
      external_ip_address_master_2 = var.external_ip_address_master_2
      internal_ip_address_master_2 = var.internal_ip_address_masters_2

      hostname_app_1            = var.hostname_app_1
      external_ip_address_app_1 = var.external_ip_address_app_1
      internal_ip_address_app_1 = var.internal_ip_address_app_1

      hostname_app_2            = var.hostname_app_2
      external_ip_address_app_2 = var.external_ip_address_app_2
      internal_ip_address_app_2 = var.internal_ip_address_app_2

    }
  )
  filename = "./hosts"
}
