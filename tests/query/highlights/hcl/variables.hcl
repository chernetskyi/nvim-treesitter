value = user.name
#       ^ @variable
#       ^ !variable.builtin

values = [for item in items : item.name]
#                             ^ @variable
#                             ^ !variable.builtin

value = users[0].name
#       ^ @variable
#       ^ !variable.builtin
