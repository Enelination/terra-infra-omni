resource "aws_lb" "app" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.private[*].id
  enable_deletion_protection = false
  enable_http2       = true
  security_groups    = [aws_security_group.application.id]
}


resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      # content      = "OK"
    }
  }
}
