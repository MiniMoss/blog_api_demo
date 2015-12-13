module ApplicationHelper
  # split帮助方法，避免IE9以下版本出现4096错误
  def splited_stylesheet(name, n=10)
    return unless Rails.env.production?

    tags = (2..[2, n].max).map do |i|
      stylesheet_link_tag "#{name}_split#{i}", :media => "all", 'data-turbolinks-track' => true
    end

    "<!--[if lte IE 9]>#{tags.join}<![endif]-->".html_safe
  end
end
