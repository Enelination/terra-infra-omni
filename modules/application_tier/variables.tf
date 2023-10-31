variable "instance_count" {
  type    = number
  description = "The number of EC2 instances in the application tier."
}

variable "subnet_ids" {
  type    = list(string)
  description = "A list of subnet IDs for the EC2 instances."
}

variable "security_group_ids" {
  type    = list(string)
  description = "A list of security group IDs for the EC2 instances."
}

variable "load_balancer_arn" {
  type    = string
  description = "The ARN of the Application Load Balancer."
}

variable "vpc_id" {
  type    = string
  description = "The ID of the VPC where resources will be created."
}