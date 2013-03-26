def full_title(page_title)
  base_title = "Logiloans"
  default_title = "Loans that make sense - Logiloans"
  if page_title.empty?
    default_title
  else
    "#{page_title} | #{base_title}"
  end
end
