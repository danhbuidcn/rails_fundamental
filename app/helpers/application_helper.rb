# frozen_string_literal: true

module ApplicationHelper
  # Returns the appropriate Bootstrap alert class based on the flash type
  def flash_class(type)
    Constants::FLASH_CLASSES[type] || 'alert-primary' # Fallback class
  end
end
