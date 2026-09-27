settings {
  plain = <<EOT
first
  nested
last
EOT
  indented = <<-EOT
    first
      nested

    last
  EOT
  template = <<-EOT
    %{ if enabled }
      ${message}
    %{ endif }
  EOT
  after = true
}
