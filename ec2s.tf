resource "aws_instance" "ec2-bastian" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-remote-ssh.id}",
  "${aws_security_group.allow-outgoing-internal-ssh.id}"]
  key_name = "${aws_key_pair.instance-key.key_name}"

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
  key_name = "${aws_key_pair.instance-key.key_name}"

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
  key_name = "${aws_key_pair.instance-key.key_name}"

  tags = {
    Name = "web-server"
  }

}
resource "aws_instance" "ec2-gocd-server" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.instance-key.key_name}"

  tags = {
    Name = "gocd-server"
  }

}


resource "aws_instance" "ec2-nexus-server" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public-subnet-b.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-incoming-internal-ssh.id}",
  "${aws_security_group.allow-outgoing-http.id}"]
  key_name = "${aws_key_pair.instance-key.key_name}"

  tags = {
    Name = "nexus-server"
  }

}



