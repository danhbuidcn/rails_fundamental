# frozen_string_literal: true

module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_key_apply(key)
    case key
    when 'notice'
      'success'
    when 'alert'
      'danger'
    else
      key
    end
  end
end
