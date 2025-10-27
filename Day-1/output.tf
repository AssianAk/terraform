output "ecte2" {
  description = "print public ip"
  value = aws_instance.ec2.public_ip
}

