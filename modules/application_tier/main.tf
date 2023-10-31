
# Create EC2 instances in the application tier
resource "aws_instance" "app" {
  count         = var.instance_count
  ami           = "ami-09a331a464f968224"
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = var.security_group_ids
}

# Create a target group for the Application Load Balancer
resource "aws_lb_target_group" "app" {
  name     = "my-app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Create a listener for the Application Load Balancer
resource "aws_lb_listener" "app" {
  load_balancer_arn = var.load_balancer_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
    }
  }
}
