resource "aws_security_group" "lb" {
  name = format("%s-load-balancer", var.project_name)

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

}

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "liberando trafego na porta 80"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_443" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  description       = "liberando trafego na porta 443"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}