provider "aws" {
  access_key = "AKIARAIWEJWFMK73BHUE"
  secret_key = "oSGB1rkrn3OzRtHj0vSMDPeADY53t21JI2vl/Qra"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0204cddbf060b2420"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
