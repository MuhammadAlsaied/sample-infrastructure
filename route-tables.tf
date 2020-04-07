
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.vpc-magic.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-magic.id}"
  }
}

resource "aws_route_table_association" "public-rt-a" {
  subnet_id      = "${aws_subnet.public-subnet-a.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

resource "aws_route_table_association" "public-rt-b" {
  subnet_id      = "${aws_subnet.public-subnet-b.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}




resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.vpc-magic.id}"
}

resource "aws_route_table_association" "private-rt-a" {
  subnet_id      = "${aws_subnet.private-subnet-a.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}

resource "aws_route_table_association" "private-rt-b" {
  subnet_id      = "${aws_subnet.private-subnet-b.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}
