


resource "aws_instance" "example" {
  ami           = "ami-07edab31d909a5063"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.new.id]
  tags = {
    Name = "new_instance"
  }
}



resource "aws_security_group" "new" {
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

