terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

# Variables
variable "filename" {
  description = "Name of the file"
  type        = string
}

variable "message" {
  description = "Content of the file"
  type        = string
}

# Resource
resource "local_file" "file" {
  filename = "${path.module}/${var.filename}"
  content  = var.message
}

# Output
output "file_name" {
  value = local_file.file.filename
}
