resource "aws_lb" "alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [for snet in aws_subnet.subnets : snet.id]

  tags = merge(local.common_tags, {
    Name = var.lb_name
  })

}

resource "aws_lb_target_group" "tg" {
  name     = "${var.lb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

  tags = merge(local.common_tags, {
    Name = "${var.lb_name}-tg"
  })
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  for_each = aws_instance.ec2

  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = each.value.id
  port             = 80
}