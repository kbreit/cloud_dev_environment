resource "digitalocean_droplet" "devel" {
    image = "ubuntu-18-04-x64"
    name = "devel"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    private_networking = false
    tags = ["development"]
    ssh_keys = [ 
        "${var.ssh_fingerprint}"
    ]
    # connection {
    #     user = "root"
    #     type = "ssh"
    #     private_key = "${file(var.pvt_key)}"
    #     timeout = "2m"
    # }
    provisioner "local-exec" {
        command = "sleep 60 ; ansible-playbook -i inventory --ask-vault-pass main.yaml"
    }
}


