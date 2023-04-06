terraform {
  required_version = "~> 1.4.0"
}

module "foo" {
  source = "./module"

  foo = "hello"
  bar = "world"
}

resource "terraform_data" "foo_output" {
  input = module.foo.foo_output
}

resource "terraform_data" "bar" {
  input = "bar"

  lifecycle {
    replace_triggered_by = [
      terraform_data.foo_output,
    ]
  }
}