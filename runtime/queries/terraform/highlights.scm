; inherits: hcl

; Namespace roots must be followed by an attribute access, allowing comments.
; Bare object keys and iterator values can have the same names as namespaces.
(_
  (variable_expr
    (identifier) @variable.builtin
    (#any-of? @variable.builtin
      "data" "var" "local" "module" "output" "count" "each" "self" "terraform" "action" "caller"
      "ephemeral"))
  .
  (comment)*
  .
  (get_attr))

; path.root/cwd/module
(_
  (variable_expr
    (identifier) @type.builtin
    (#eq? @type.builtin "path"))
  .
  (comment)*
  .
  (get_attr
    (identifier) @variable.builtin
    (#any-of? @variable.builtin "root" "cwd" "module")))

; terraform.workspace
(_
  (variable_expr
    (identifier) @type.builtin
    (#eq? @type.builtin "terraform"))
  .
  (comment)*
  .
  (get_attr
    (identifier) @variable.builtin
    (#eq? @variable.builtin "workspace")))

; Terraform specific keywords
; FIXME: ideally only for identifiers under a `variable` block to minimize false positives
((identifier) @type.builtin
  (#any-of? @type.builtin "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))

(object_elem
  val: (expression
    (variable_expr
      (identifier) @type.builtin
      (#any-of? @type.builtin "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))))
