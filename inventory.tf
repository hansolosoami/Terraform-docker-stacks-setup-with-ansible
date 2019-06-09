data "template_file" "inventory" {
  template = "${file("inventory.tpl")}"

  depends_on = [
    "google_compute_instance.managers",
    "google_compute_instance.workers",
  ]

  vars {
    managers = "${join("\n", google_compute_instance.managers.*.network_interface.0.access_config.0.nat_ip)}"
    workers  = "${join("\n", google_compute_instance.workers.*.network_interface.0.access_config.0.nat_ip)}"
  }
}

resource "null_resource" "cmd" {
  triggers {
    template_rendered = "${data.template_file.inventory.rendered}"
  }

  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' > ansible/inventory"
  }

  provisioner "local-exec" {
    working_dir = "/home/mani/project1/ansible/"
    command     = "ansible-playbook -i inventory others.yml"
  }

  provisioner "local-exec" {
    working_dir = "/home/mani/project1/ansible/"
    command     = "ansible-playbook -i inventory main.yml"
  }

  provisioner "local-exec" {
    working_dir = "/home/mani/project1/ansible/"
    command     = "ansible-playbook -i inventory services.yml"
  }

}
