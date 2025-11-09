# Setting terraform and provider
terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0.0"
		}
	}
}

# "resources"
resource "docker_image" "nginx_image" {
	name = "nginx:latest"
}

# define "resources" in resources
resource "docker_container" "nginx_web_server" {
	# dependancy: Exec after finishing "resource"
	image = docker_image.nginx_image.image_id
	name = "my-terraform-nginx"

	ports {
		internal = 80
		external = 8080
	}
}