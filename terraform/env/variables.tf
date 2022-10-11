variable prefix {
  type        = string
  description = "A unique prefix to identify these resources"
}

variable environment {
  type    = string
  default = "env"
}

variable resource_group_name {
  type    = string
  default = "test-rg"
}

variable app_service_name {
  type    = string
  default = "test-app"
}
