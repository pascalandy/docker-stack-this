resource "aws_alb" "default" {
  name = "alb-api"
  internal = false
  security_groups = ["${aws_security_group.alb_sg.id}"]

  tags {
    Environment = "testing"
  }
}

resource "aws_alb_listener" "listener" {
  load_balancer_arn = "${aws_alb.default.arn}"
  port = "80"
  protocol = "HTTP"

  default_action = {
    target_group_arn = "${aws_alb_target_group.movies.arn}"
  }
}

resource "aws_alb_target_group" "movies" {
  name = "movies-tg"
  port = 5000
  protocol = "HTTP"

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    path = "/health"
  }
}

resource "aws_alb_target_group" "books" {
  name = "books-tg"
  port = 5000
  protocol = "HTTP"

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    path = "/health"
  }
}

resource "aws_alb_listener_rule" "movies-api" {
  listener_arn = "${aws_alb_listener.listener.arn}"
  priority = 1
  action {
      type = "forward"
      target_group_arn = "${aws_alb_target_group.movies.arn}"
    }
  condition {
      field = "path-pattern"
      values = ["/movies"]
    }
}

resource "aws_alb_listener_rule" "books-api" {
  listener_arn = "${aws_alb_listener.listener.arn}"
  priority = 1
  action {
      type = "forward"
      target_group_arn = "${aws_alb_target_group.books.arn}"
    }
  condition {
      field = "path-pattern"
      values = ["/books"]
    }
}
