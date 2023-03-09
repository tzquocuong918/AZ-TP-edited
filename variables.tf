# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "CSC X"
}

variable "root_name" {
  type    = string
  default = "CSC Team"
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "cuong.dq@csc-jsc.com"
}

variable "management_resources_location" {
  type    = string
  default = "eastus"
}
