output "aws_instance" {
  value = module.aws_instance.module_instance.public_ip
}