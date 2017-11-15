provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "movies-instance" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyname}"
  security_groups =  ["${aws_security_group.api_sg.name}"]

  tags {
    Name = "movies-instance"
  }

  provisioner "file" {
    source = "movies/"
    destination = "/home/ec2-user/"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("${var.private_key}")}"
    }
  }

  user_data = "${file("setup.sh")}"
}

resource "aws_instance" "books-instance" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyname}"
  security_groups =  ["${aws_security_group.api_sg.name}"]

  tags {
    Name = "books-instance"
  }

  provisioner "file" {
    source = "books/"
    destination = "/home/ec2-user/"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("${var.private_key}")}"
    }
  }

  user_data = "${file("setup.sh")}"
}
