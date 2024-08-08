# frozen_string_literal: true

module ApplicationHelper
  # Returns title of page
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  # Returns the appropriate Bootstrap alert class based on the flash type
  def flash_class(type)
    Constants::FLASH_CLASSES[type] || 'alert-primary' # Fallback class
  end
end
