variable "region" {
  type = string
}


variable "storage" {
    default = "prodalpha1"
  
}

variable "tier" {
  type = string
}

variable "size" {
  type = string
}


variable "ip_range" {
  type        = string
  description = "The IP range for the virtual network."
}

variable "ip_subnet" {
  type        = string
  description = "The subnet for the virtual network."
}