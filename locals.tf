locals {
  machine_type = "e2-medium"
  node_count   = 1
  subnet_name  = "${var.application}-${var.subnet_name}"
}