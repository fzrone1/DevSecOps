variable "civo_token" {
  description = ""
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Civo region (e.g., LON1)"
  type        = string
  default     = "LON1"
}
