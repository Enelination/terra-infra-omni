resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public" {
  count           = 3
  cidr_block      = "10.0.${count.index}.0/24"
  availability_zone = element(["eu-west-3a", "eu-west-3b", "eu-west-3c"], count.index)
  vpc_id          = aws_vpc.main.id
}

resource "aws_subnet" "private" {
  count           = 3
  cidr_block      = "10.0.${count.index + 10}.0/24"
  availability_zone = element(["eu-west-3a", "eu-west-3b", "eu-west-3c"], count.index)
  vpc_id          = aws_vpc.main.id
}
