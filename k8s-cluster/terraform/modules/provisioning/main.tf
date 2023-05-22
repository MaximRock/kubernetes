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
      "sudo apt install pip -y",
      "mkdir ~/k8s-cluster",
      "cd ~/k8s-cluster",
      "git clone https://github.com/kubernetes-sigs/kubespray.git",
      "cd ./kubespray",
      "sudo pip install -r requirements.txt",
      "cp -rfp inventory/sample inventory/k8s-project",
    ]
  }

  #   provisioner "file" {
  #     source      = "inventory.ini"
  #     destination = "~/k8s-cluster-1"
  #   }

}
