resource "tls_private_key" "magic-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "insance-key" {
  key_name   = "insance-key"
  public_key = "${tls_private_key.magic-key.public_key_openssh}"
}



resource "local_file" "instance-key" {
  content  = "${tls_private_key.magic-key.private_key_pem}"
  filename = "instance-key.pem"

}


resource "aws_secretsmanager_secret" "ec2-private" {
  name = "ec2-private"
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = "${aws_secretsmanager_secret.ec2-private.id}"
  secret_string = "${tls_private_key.magic-key.private_key_pem}"
}

