variable "prefix" {
  type        = string
}

variable resource_group_name {
  type        = string
}

variable "network_name" {
  type        = string
}

variable "subnet_name" {
  type        = string
}

variable "subnetwork_rg" {
  type        = string
}

variable "app_service_name" {
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

variable "app_plan_sku" {
  type        = string
  default     = "P1v2"
}

variable "app_plan_worker_count" {
  type        = number
  default     = 1
}
