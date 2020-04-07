
resource "aws_security_group" "allow-incoming-remote-ssh" {
  name   = "allow-incoming-remote-ssh"
  vpc_id = "${aws_vpc.vpc-magic.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "allow-incoming-internal-ssh" {
  name   = "allow-incoming-internal-ssh"
  vpc_id = "${aws_vpc.vpc-magic.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr}"]
  }

}



resource "aws_security_group" "allow-outgoing-internal-ssh" {
  name   = "allow-outgoing-internal-ssh"
  vpc_id = "${aws_vpc.vpc-magic.id}"

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr}"]
  }
}


resource "aws_security_group" "allow-incoming-http" {
  name   = "allow-incoming-http"
  vpc_id = "${aws_vpc.vpc-magic.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "allow-outgoing-http" {
  name   = "allow-outgoing-http"
  vpc_id = "${aws_vpc.vpc-magic.id}"


  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 433
    to_port     = 433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
