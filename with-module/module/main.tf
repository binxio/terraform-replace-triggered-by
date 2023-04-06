terraform {
  required_providers {
    terraform = {
      source = "terraform.io/builtin/terraform"
    }
  }
}

variable "foo" {
  type        = string
}

variable "bar" {
  type        = string
}

resource "terraform_data" "foo" {
  input = var.foo
}

resource "terraform_data" "bar" {
  triggers_replace = var.bar
}

output "foo_output" {
  value = terraform_data.foo
}

output "bar_output" {
  value = terraform_data.bar
}
