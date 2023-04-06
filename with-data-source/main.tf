terraform {
  required_version = "~> 1.4.0"
}

data "local_file" "foo" {
  filename = "./foo.txt"
}

resource "terraform_data" "local_file_foo" {
  input = data.local_file.foo.content_sha256
}

resource "terraform_data" "bar" {
  input = "bar"

  lifecycle {
    replace_triggered_by = [
      terraform_data.local_file_foo,
    ]
  }
}
