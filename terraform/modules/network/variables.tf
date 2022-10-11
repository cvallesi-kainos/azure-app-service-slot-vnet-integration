variable "prefix" {
  type        = string
}

variable resource_group_name {
  type        = string
}

variable "environment" {
  type        = string
  default     = "env"
}

variable "location" {
  type        = string
  default     = "uksouth"
}
