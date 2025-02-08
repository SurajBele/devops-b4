output "aws_instance" {
  value = module.my_instance.aws_instance.module_instance.public_ip
}