provider "local" {}

resource "local_file" "config" {
  content  = templatefile("${path.module}/config.yml.tpl", {
    app_name = var.app_name
    app_url  = var.app_url
  })
  filename = "${path.module}/config.yml"
}