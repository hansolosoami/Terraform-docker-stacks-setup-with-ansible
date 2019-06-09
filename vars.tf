variable "project" {
  description = "GCP project where resources will be created"
  default     = "devops-242412"
}

variable "region" {
  description = "location for your resources to be created in"
  default     = "us-central1"
}

variable "zone" {
  description = "Availability zone"
  default     = "us-central1-c"
}

variable "ssh_user" {
  description = "GCE SSH username"
  default     = "ubuntu"
}

variable "ssh_pub_key_file" {
  description = "SSH Public key path"
  default     = "ssh_project.pub"
}

variable "image_name" {
  description = "Image to be used"
  default     = "ubuntu-1604-xenial-v20190605"
}

variable "swarm_managers" {
  description = "Number of Swarm managers"
  default     = 1
}

variable "swarm_managers_instance_type" {
  description = "Machine type"
  default     = "n1-standard-1"
}

variable "swarm_workers" {
  description = "Number of Swarm workers"
  default     = 1
}

variable "swarm_workers_instance_type" {
  description = "Machine type"
  default     = "n1-standard-1"
}
