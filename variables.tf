variable "instance_count" {
  description = "Default instance count for all modules"
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
  default     = [] # You can set a default list if needed, or you can specify the values when using the module.
}
