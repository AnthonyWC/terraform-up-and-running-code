variable "pet_prefixes" {
  description = "List of animal prefixes"
  default     = ["fido", "felix", "duke", "sally"]
}
resource "random_shuffle" "pet" {
  input = var.pet_prefixes
}
output "shuffled_output" {
  # You can use *
  value = "${random_shuffle.pet.*.result}"
}
