# null_resource

resource "null_resource" "preparation-srv" {
  #depends_on = [yandex_compute_instance_group.k8s-masters]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = var.hostname_srv_instans
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "mkdir /home/admin/k8s-cluster",
      "sudo apt install pip -y",
      "cd ~/k8s-cluster",
      "git clone https://github.com/kubernetes-sigs/kubespray.git",
      "cd ./kubespray",
      "sudo pip install -r requirements.txt",
      "cp -rfp inventory/sample inventory/mycluster",
    ]
  }

  provisioner "file" {
    source      = "D:\\prog\\GitHub\\kubernetes\\k8s-cluster\\terraform\\inventory.ini"
    destination = "/home/admin/k8s-cluster/kubespray/inventory/mycluster/inventory.ini"
  }

  provisioner "file" {
    source      = "D:\\prog\\GitHub\\kubernetes\\k8s-cluster\\terraform\\my.key"
    destination = "/home/admin/.ssh/my.key"
  }

  provisioner "file" {
    source      = "D:\\prog\\GitHub\\kubernetes\\k8s-cluster\\terraform\\my.key.pub"
    destination = "/home/admin/.ssh/my.key.pub"
  }

  provisioner "remote-exec" {
    inline = [
      "cd ~/.ssh",
      "chmod 600 my.key",
    ]
  }

  provisioner "file" {
    source      = "D:\\prog\\GitHub\\jenkins\\project_jenkins\\ansible"
    destination = "/home/admin/k8s-cluster/"
  }

}
