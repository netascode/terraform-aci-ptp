variable "admin_state" {
  description = "PTP admin state"
  type        = bool
  default     = false
}

variable "global_domain" {
  description = "Global domain"
  type        = number
  default     = 0

  validation {
    condition     = var.global_domain >= 0 && var.global_domain <= 128
    error_message = "Valid values are 0 to 128."
  }
}

variable "profile" {
  description = "PTP Profile - choices: `aes67`, `default`, `smpte`, `telecom_full_path`"
  type        = string
  default     = "aes67"

  validation {
    condition     = contains(["aes67", "default", "smpte", "telecom_full_path"], var.profile)
    error_message = "Valid values are `aes67`, `default`, `smpte`, `telecom_full_path."
  }
}

variable "announce_interval" {
  description = "Announce interval"
  type        = number
  default     = 1

  validation {
    condition     = var.announce_interval >= -3 && var.announce_interval <= 4
    error_message = "Valid values: aes67: 0 to 4, default: 0 to 4, smpte: -3 to 1, telecom_full_path: -3"
  }
}

variable "announce_timeout" {
  description = "Announce timeout"
  type        = number
  default     = 3

  validation {
    condition     = var.announce_timeout >= 2 && var.announce_timeout <= 10
    error_message = "Valid values are 2 to 10 for aes67, default, and smpte, and 2 to 4 for telecom_full_path"
  }
}

variable "sync_interval" {
  description = "sync interval"
  type        = number
  default     = -3

  validation {
    condition     = var.sync_interval >= -7 && var.sync_interval <= 1
    error_message = "Valid values: aes67: -4 to 1, default: -1 to 1, smpte: -7 to 1, telecom_full_path: -4"
  }
}

variable "delay_interval" {
  description = "delay interval"
  type        = number
  default     = -2

  validation {
    condition     = var.delay_interval >= -7 && var.delay_interval <= 5
    error_message = "Valid values: aes67: -3 to 5, default: 0 to 5, smpte: -7 to 4, telecom_full_path: -4"
  }
}
