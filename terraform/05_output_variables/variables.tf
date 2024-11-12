
variable "my_list" {
  description = "A list of strings with a minimum length requirement"
  type        = list(string)
  validation {
    condition     = length(var.my_list) >= 3
    error_message = "The list must contain at least 3 items."
  }
}