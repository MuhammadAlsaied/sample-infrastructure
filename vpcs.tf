
resource "aws_vpc" "vpc-magic" {
  cidr_block = "${var.vpc-cidr}"
}

resource "aws_internet_gateway" "gw-magic" {
  vpc_id = "${aws_vpc.vpc-magic.id}"
}

