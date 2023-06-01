variable vpc_name {
  type        = string
  default     = "webapp"
  description = "vpc name"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable public_cidr {
  type        = string
  default     = "10.0.1.0/24"
  description = "public subnet cidr"
}

variable private_cidr {
  type        = string
  default     = "10.0.2.0/24"
  description = "private subnet cidr"
}

variable azs {
  type        = list
  default     = ["us-east-1a","us-east-1b"]
  description = "availability zones"
}

variable backend_instance_name {
  type        = string
  default     = "backend"
  description = "description"
}


variable backend_ami {
  type        = string
  default     = "ami-026ebd4cfe2c043b2"
  description = "backend ami"
}

variable backend_instance_type {
  type        = string
  default     = "t2.micro"
  description = "backend instance ami"
}

variable env {
  type        = string
  default     = "dev"
  description = "locals vars"
}

variable team {
  type        = string
  default     = "alpha"
  description = "locals vars"
}