module "notes_page" {
  source            = "git::https://github.com/tomondre/raspberry-kubernetes-cluster.git//terraform-modules/reusable-modules/full-deployment"
  service_name      = "notes-page"
  host_name         = "notes"
  health_check_path = "/"
  image_url         = "docker.io/tomondre/notes-page"
  port              = 80
  image_tag         = var.image_tag
}

variable "image_tag" {}