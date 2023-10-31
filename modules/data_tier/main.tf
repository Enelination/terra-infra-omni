resource "aws_instance" "db" {
  count         = var.instance_count
  ami           = "ami-09a331a464f968224"
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = var.security_group_ids
}

