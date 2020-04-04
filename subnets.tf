resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = "${aws_vpc.vpc-magic.id}"
  cidr_block              = "10.0.0.0/18"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "public-subnet-b" {
  vpc_id            = "${aws_vpc.vpc-magic.id}"
  cidr_block        = "10.0.64.0/18"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "private-subnet-a" {
  vpc_id            = "${aws_vpc.vpc-magic.id}"
  cidr_block        = "10.0.128.0/18"
  availability_zone = "eu-west-1a"

}

resource "aws_subnet" "private-subnet-b" {
  vpc_id            = "${aws_vpc.vpc-magic.id}"
  cidr_block        = "10.0.192.0/18"
  availability_zone = "eu-west-1b"

}
