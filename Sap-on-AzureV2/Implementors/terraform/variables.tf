variable "location" {
  description = "Location to deploy resources"
  type        = string
  default     = "westeurope"
}

variable "tags" {
  type = map

  default = {
    environment = "landingzone"
    deployment  = "terraform"
    microhack   = "sap-data"
  }
}

variable "prefix" {
  type        = string
  default     = "sap-data"
}

variable "username" {
  description = "Administrator user name for virtual machine"
  type        = string
  default     = "azureadmin"
}

variable "password" {
  description = "Password must meet Azure complexity requirements"
  type        = string
  default     = "Sapdata!pass123"
}

variable "SID" {
  description = "The SAP SID name"
  type        = string
  default     = "S4D"
}

