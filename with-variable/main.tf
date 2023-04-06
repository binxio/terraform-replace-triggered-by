terraform {
  required_version = "~> 1.4.0"
}

variable "foo" {
  type = string
  default = "hello"
}

resource "terraform_data" "variable_foo" {
  input = var.foo
}

resource "terraform_data" "bar" {
  input = "bar"

  lifecycle {
    replace_triggered_by = [
      terraform_data.variable_foo,
    ]
  }
}
