output "subnet" {
    value = aws_subnet.myapp-subnet-1
}

output "subnet_id_1" {
  description = "ID of the created subnet"
  value       = aws_subnet.myapp-subnet-1.id
}

output "subnet_id_2" {
  description = "ID of the second created subnet"
  value       = aws_subnet.myapp-subnet-2.id
}