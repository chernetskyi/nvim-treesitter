; highlights.scm
[
  "!"
  "*"
  "/"
  "%"
  "+"
  "-"
  ">"
  ">="
  "<"
  "<="
  "=="
  "!="
  "&&"
  "||"
] @operator

[
  "{"
  "}"
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

[
  "."
  ".*"
  ","
  "[*]"
] @punctuation.delimiter

[
  (ellipsis)
  "?"
  "=>"
] @punctuation.special

[
  ":"
  "="
] @none

[
  "for"
  "endfor"
  "in"
] @keyword.repeat

[
  "if"
  "else"
  "endif"
] @keyword.conditional

[
  (quoted_template_start) ; "
  (quoted_template_end) ; "
  (template_literal) ; non-interpolation/directive content
] @string

[
  (heredoc_identifier) ; END
  (heredoc_start) ; << or <<-
] @punctuation.delimiter

[
  (template_interpolation_start) ; ${
  (template_interpolation_end) ; }
  (template_directive_start) ; %{
  (template_directive_end) ; }
  (strip_marker) ; ~
] @punctuation.special

(numeric_lit) @number

(bool_lit) @boolean

(null_lit) @constant

(comment) @comment @spell

(identifier) @variable

(body
  (block
    (identifier) @keyword))

(body
  (block
    (body
      (block
        (identifier) @type))))

(function_call
  (identifier) @function)

(attribute
  (identifier) @variable.member)

; { key: val }
;
; highlight identifier keys as though they were block attributes
(object_elem
  key: (expression
    (variable_expr
      (identifier) @variable.member)))

; Attribute access does not make its root a built-in variable.
(expression
  (variable_expr
    (identifier))
  (get_attr
    (identifier) @variable.member))
