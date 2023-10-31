variable "instance_count" {
  description = "Number of web server instances"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for web servers"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for web servers"
  type        = list(string)
}
