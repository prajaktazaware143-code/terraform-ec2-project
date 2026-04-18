resource "aws_security_group" "sg" {
  name        = "terra_sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.net.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terra_sg"
  }
}

 resource "aws_instance" "ec2" {
   ami           = "ami-0f58b397bc5c1f2e8"
   instance_type = "t3.micro"

   subnet_id = aws_subnet.sub.id

   key_name     = "terra-key"
   vpc_security_group_ids = [aws_security_group.sg.id]

   tags = {
     Name = "terra-ec2"
   }
 }

 resource "aws_instance" "ec2_1" {
  ami           = "ami-0f58b397bc5c1f2e8" 
  instance_type = "t3.micro" 

  subnet_id = aws_subnet.sub.id

  key_name               = "terra-key"
  vpc_security_group_ids = [aws_security_group.sg.id]

  associate_public_ip_address = true  


  # USER DATA (AUTO SETUP)
  # =========================
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Hello parajakta 🚀</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "terra-ec2"
  }
}

# =========================
# Output Public IP
# =========================
output "public_ip" {
  value = aws_instance.ec2.public_ip
}