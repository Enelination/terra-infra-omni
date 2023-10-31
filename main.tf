terraform {
  cloud {
    organization = "Enel-Tech"

    workspaces {
      name = "enel-tf"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

module "application_tier" {
  source = "./modules/application_tier"
  instance_count     = 2
  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_security_group.application.id]
  load_balancer_arn  = aws_lb.app.arn
  vpc_id             = aws_vpc.main.id 
  # availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"] # Add the availability zones here
  # public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] # Add the public subnet CIDR blocks here
}

module "data_tier" {
  source = "./modules/data_tier"
  instance_count     = 1
  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_security_group.data.id]
  db_instance_id     = aws_db_instance.db.id
}



