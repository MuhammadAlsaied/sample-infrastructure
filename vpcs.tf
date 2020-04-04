
resource "aws_vpc" "vpc-magic" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw-magic" {
  vpc_id = "${aws_vpc.vpc-magic.id}"
}

