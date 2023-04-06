terraform {
  required_version = "~> 1.4.0"
}

resource "terraform_data" "foo" {
  input = "foo"
}

resource "terraform_data" "bar" {
  input = "bar"

  lifecycle {
    replace_triggered_by = [
      terraform_data.foo
    ]
  }
}
