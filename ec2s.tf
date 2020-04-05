resource "aws_instance" "ec2-bastian" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-remote-ssh.id}",
  "${aws_security_group.allow-outgoing-internal-ssh.id}"]
  key_name = "${aws_key_pair.insance-key.key_name}"

  tags = {
    Name = "bastion"
  }

}


resource "aws_instance" "ec2-web-server-1" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
    "${aws_security_group.allow-incoming-http.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.insance-key.key_name}"

  tags = {
    Name = "web-server"
  }

}

resource "aws_instance" "ec2-web-server-2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-b.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
    "${aws_security_group.allow-incoming-http.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.insance-key.key_name}"

  tags = {
    Name = "web-server"
  }

}
resource "aws_instance" "ec2-db-server-1" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private-subnet-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.insance-key.key_name}"

  tags = {
    Name = "db-server"
  }

}


resource "aws_instance" "ec2-db-server-2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private-subnet-b.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.insance-key.key_name}"

  tags = {
    Name = "db-server"
  }

}



