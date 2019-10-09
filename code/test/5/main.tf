# Tour of terraform
# 0.12

variable "count_sp" {
  default = 1
}

variable "default_prefix" {
  default = "linus"
}

resource "random_pet" "my_pet" {
  count = "${var.count_sp}"
  prefix = "${var.default_prefix}"
}

# random_pet.my_pet[0]: Creating...
# random_pet.my_pet[0]: Creation complete after 0s [id=linus-needed-unicorn]

output "pet_name" {
  value = "${random_pet.my_pet}[0]"
}
