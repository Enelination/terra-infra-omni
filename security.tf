resource "aws_security_group" "presentation" {
  name_prefix = "presentation-"
  vpc_id      = aws_vpc.main.id

  # Ingress rule for HTTP (Port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule for SSH (Port 22) from anywhere (for administration)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all outbound traffic (0.0.0.0/0)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "application" {
  name_prefix = "application-"
  vpc_id      = aws_vpc.main.id

  # Define your security group rules for the application tier here
  # For example:
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "data" {
  name_prefix = "data-"
  vpc_id      = aws_vpc.main.id

  # Define your security group rules for the data tier here
  # For example:
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
