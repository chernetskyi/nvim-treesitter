settings {
  list = [for item in items :
    item.name
    if item.enabled
  ]
  object = {for item in items :
    item.name => item.value
    if item.enabled
  }
  wrapped = (
    enabled ?
    "yes" :
    "no"
  )
  nested = [for group in groups :
    [for item in group :
      item.name
    ]
  ]
  after = true
}
