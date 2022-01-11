resource "google_compute_instance_template" "app_template" {
  name         = "app-template"
  machine_type = var.template_type
  disk {
    auto_delete  = "true"
    source_image = var.template_image
  }
  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.vpc_subnet.id
  }
  metadata_startup_script = <<SCRIPT
#!/bin/bash
apt update
apt -y install apache2
hostname -f > /var/www/html/index.html
cat <<EOF >> /var/www/html/index.html
<html><body><p>Linux startup script from Cloud Storage.</p></body></html>
SCRIPT
}
