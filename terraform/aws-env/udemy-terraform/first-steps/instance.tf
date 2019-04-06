provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0204cddbf060b2420"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
