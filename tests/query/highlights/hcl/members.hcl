value = user.name
#            ^ @variable.member

value = user.name == other.name
#            ^ @variable.member
#                          ^ @variable.member

value = users[0].name
#                ^ @variable.member

value = lookup(users, "a").name
#                          ^ @variable.member

value = users[*].name
#                ^ @variable.member

value = users.*.name
#               ^ @variable.member

value = (user).name
#              ^ @variable.member

value = !user.enabled
#             ^ @variable.member
