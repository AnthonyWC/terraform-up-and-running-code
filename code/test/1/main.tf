# https://medium.com/rigged-ops/terraform-0-12-examples-c6b6770c0c0d

variable "pet_prefixes" {
  description = "List of animal prefixes"
  default     = ["fido", "felix", "duke", "sally"]
}
resource "random_shuffle" "pet" {
  input = [
    # for
    for pet in var.pet_prefixes:
      upper(pet)
  ]
}
output "shuffled_output" {
  value = random_shuffle.pet.result
}
