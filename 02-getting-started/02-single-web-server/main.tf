provider "aws" {
  region      = "us-east-2"
}


resource "aws_instance" "fusion" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example"
  }
}
