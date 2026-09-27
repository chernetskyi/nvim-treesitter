[
  (block)
  (object)
  (tuple)
  (function_call)
  (for_tuple_expr)
  (for_object_expr)
] @indent.begin

(expression
  "("
  ")") @indent.begin

[
  "]"
  ")"
  "}"
] @indent.branch @indent.end

(comment) @indent.auto

(ERROR) @indent.auto

; Heredoc whitespace is part of the string value, including relative indentation
; in indented heredocs. Preserve it rather than applying the surrounding block.
(heredoc_template) @indent.auto
