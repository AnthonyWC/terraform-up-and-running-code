variable "whose" {
  description = "Who's animal this is"
  type        = string
  # Look - you can set it to null and it works!
  default     = null
}

variable "yours_length" {
  description = "Length in words that your pet's name should be"
  type        = string
  default     = "3"
}

variable "mine_length" {
  description = "Length in words that my pet's name should be"
  type        = string
  default     = "2"
}

# Resource random_pet generates random pet names; used as unique identifiers
resource "random_pet" "pet" {
  length    = (var.whose == "yours" ? var.yours_length : var.mine_length)
  # null?
  prefix    = var.whose
  separator = "-"
}

output "pet_name" {
# id is generated
# Terraform will perform the following actions:

#   # random_pet.pet will be created
#   + resource "random_pet" "pet" {
#       + id        = (known after apply)
#       + length    = 2
#       + separator = "-"
#     }
  value = "${random_pet.pet.id}"
}
