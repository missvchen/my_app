module ApplicationHelper
  # Returns the full title on a per-page basis.               # Documentation comment
  def full_title(page_title)                                  # Method definition
    base_title = "Logiloans"                                  # Variable assignment
    default_title = "Loans that make sense - #{base_title}"   # Variable assignment
    if page_title.empty?                                      # Boolean test
      default_title                                           # Implicit return
    else
      "#{page_title} | #{base_title}"                         # String interpolation
    end
  end
end
