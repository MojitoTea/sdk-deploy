# ------------------------------------------------------------------------------
# VARIABLES NETWORK
# ------------------------------------------------------------------------------

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "VPC_SocialNetwork"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.99.0.0/18"
}

variable "vpc_azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_public_subnets" {
  description = "The public subnets CIDR blocks"
  type        = list(string)
  default     = ["10.99.0.0/24", "10.99.1.0/24"]
}

variable "vpc_private_subnets" {
  description = "The private subnets CIDR blocks"
  type        = list(string)
  default     = ["10.99.2.0/24", "10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24", "10.99.6.0/24", "10.99.13.0/24"]
}

variable "vpc_database_subnets" {
  description = "The database subnets CIDR blocks"
  type        = list(string)
  default = [
    "10.99.7.0/24",
    "10.99.8.0/24",
    "10.99.9.0/24",
    "10.99.10.0/24",
    "10.99.11.0/24",
    "10.99.12.0/24"
  ]
}

variable "vpc_tags" {
  description = "Additional tags for the VPC resources"
  type        = map(string)
  default = {
    Name        = "vpc_socialnetwork"
    Owner       = "Nikita"
    Environment = "dev"
  }
}

# ------------------------------------------------------------------------------
# VARIABLES SECURITYGROUPS
# ------------------------------------------------------------------------------
variable "web_sg_name" {
  description = "Назва безпекової групи для веб-сервера"
  type        = string
  default     = "web_sg"
}

variable "ssh_port" {
  description = "Port SSH"
  type        = number
  default     = 22
}


variable "backendmain_port" {
  description = "Port Backend Main"
  type        = number
  default     = 3000
}

variable "backendauth_port" {
  description = "Port Backend Auth"
  type        = number
  default     = 9090
}


variable "backendstorage_port" {
  description = "Port Backend Storage"
  type        = number
  default     = 9560
}

variable "http_port" {
  description = "Port HTTP"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port HTTPS"
  type        = number
  default     = 443
}
# ------------------------------------------------------------------------------
# VARIABLES EC2
# ------------------------------------------------------------------------------
variable "instance_count_backend" {
  description = "The number of EC2 instances to create Backend"
  type        = number
  default     = 1
}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instances"
  type        = string
  default     = "ami-0261755bbcb8c4a84"
}

variable "instance_type" {
  description = "The type of EC2 instances to create"
  type        = string
  default     = "t2.medium"
}

