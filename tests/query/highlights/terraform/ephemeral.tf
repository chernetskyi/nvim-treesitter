ephemeral "random_password" "secret" {
# <- @keyword
# <- !variable.builtin
  length = 16
}

variable "token" {
  type = string
  ephemeral = true
# ^ @variable.member
# ^ !variable.builtin
#             ^ @boolean
}

output "secret" {
  ephemeral = true
# ^ @variable.member
# ^ !variable.builtin
  value = ephemeral.random_password.secret.result
#         ^ @variable.builtin
#                   ^ @variable.member
#                                   ^ @variable.member
#                                          ^ @variable.member
}

locals {
  available = ephemeral.random_password.secret.result != ""
#             ^ @variable.builtin
  count = length(ephemeral.random_password.secret.result)
#                ^ @variable.builtin
  passwords = ephemeral.random_password.secrets[*].result
#             ^ @variable.builtin
#                                                  ^ @variable.member
  ordinary = var.ephemeral
#                ^ @variable.member
#                ^ !variable.builtin
}

locals {
  labels = { ephemeral = "name" }
#            ^ @variable.member
#            ^ !variable.builtin
}

value = ephemeral /* comment */ .random_password.secret.result
#       ^ @variable.builtin
