[
  (block)
  (object)
  (tuple)
  (function_call)
] @indent.begin

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
