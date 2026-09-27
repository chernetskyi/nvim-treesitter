value = var.name == local.name
#       ^ @variable.builtin
#                   ^ @variable.builtin

value = var.enabled && local.enabled
#       ^ @variable.builtin
#                      ^ @variable.builtin

value = !var.enabled
#        ^ @variable.builtin

value = var.items[*].name
#       ^ @variable.builtin

value = length(var.items) > 0
#              ^ @variable.builtin

value = data.aws_ami.latest.id == module.compute.image
#       ^ @variable.builtin
#                                 ^ @variable.builtin

value = count.index == 0
#       ^ @variable.builtin

value = each.value == self.id
#       ^ @variable.builtin
#                     ^ @variable.builtin

value = path.module == path.root
#       ^ @type.builtin
#            ^ @variable.builtin
#                           ^ @variable.builtin

value = terraform.workspace != "default"
#       ^ @type.builtin
#                 ^ @variable.builtin

value = !path.module
#        ^ @type.builtin
#             ^ @variable.builtin

value = path.module
#       ^ @type.builtin
#            ^ @variable.builtin

value = path.wrong.module
#                  ^ !variable.builtin

value = terraform.wrong.workspace
#                       ^ !variable.builtin

value = local.path.module
#                  ^ !variable.builtin

value = aws_instance.web.id
#       ^ !variable.builtin

value = terraform.applying
#       ^ @variable.builtin
#                 ^ @variable.member

value = terraform.applying ? local.write_role : local.read_role
#       ^ @variable.builtin

actions = [action.aws_lambda_invoke.example]
#          ^ @variable.builtin

payload = caller.output
#         ^ @variable.builtin

labels = { var = "name", local = "name", data = "name", output = "name" }
#          ^ !variable.builtin
#                        ^ !variable.builtin
#                                        ^ !variable.builtin
#                                                       ^ !variable.builtin

labels = { count = "name", each = "name", self = "name", module = "name" }
#          ^ !variable.builtin
#                          ^ !variable.builtin
#                                         ^ !variable.builtin
#                                                        ^ !variable.builtin

labels = { terraform = "name", action = "name", caller = "name" }
#          ^ !variable.builtin
#                              ^ !variable.builtin
#                                               ^ !variable.builtin

values = [for each in ["x"] : each]
#                             ^ !variable.builtin

value = var /* comment */ .name
#       ^ @variable.builtin

value = var /* first */ /* second */ .name == local /* comment */ .name
#       ^ @variable.builtin
#                                             ^ @variable.builtin

value = path /* comment */ .module
#       ^ @type.builtin
#                           ^ @variable.builtin

value = terraform /* comment */ .workspace
#       ^ @type.builtin
#                                ^ @variable.builtin

value = path /* comment */ .wrong /* comment */ .module
#                                                ^ !variable.builtin

value = terraform /* comment */ .wrong /* comment */ .workspace
#                                                     ^ !variable.builtin

value = (var # comment
#        ^ @variable.builtin
  .name)

value = path /* first
  second */ .module
#            ^ @variable.builtin
