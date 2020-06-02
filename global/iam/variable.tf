variable "user_names" {
    description = "Create IAM users using these names"
    type        = list(string)
    default     = ["jay", "jessie", "ash"]
}