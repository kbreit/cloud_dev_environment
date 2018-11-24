resource "digitalocean_droplet" "devel" {
    image = "ubuntu-18-04-x64"
    name = "devel"
    region = "nyc1"
    size = "1gb"
    private_networking = false
    ssh_keys = [ 
        "${var.ssh_fingerprint}"
    ]
    connection {
        user = "root"
        type = "ssh"
        private_key = "${file(var.pvt_key)}"
        timeout = "2m"
    }
}