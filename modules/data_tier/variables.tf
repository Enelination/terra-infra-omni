variable "instance_count" {
  description = "Number of database server instances"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for database servers"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for database servers"
  type        = list(string)
}

variable "db_instance_id" {
  description = "ID of the RDS database instance"
  type        = string
}
