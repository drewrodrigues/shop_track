module FormHelper
  def form_button_group
    content_tag :td, class: 'collapsing' do
      yield
    end
  end

  def form_icon(path, icon, options = {})
    default_options = {href: path.is_a?(Object) ? url_for(path) : path, class: 'ui icon button'}
    merged_options = default_options.merge(options)
    content_tag :a, merged_options do
      content_tag :i, '', class: "#{icon} icon", "aria-hidden": "true"
    end
  end

  def form_delete_button(path)
    link_to path, method: :delete, data: { confirm: 'Are you sure?' }, class: 'ui icon button' do
      content_tag :i, '', class: "cancel icon", "aria-hidden": "true"
    end
  end

  def form_new_button(path, text)
    link_to path, class: 'ui small icon primary right floated left labeled button' do
      concat content_tag(:i, "", "aria-hidden": "true", class: "plus icon")
      concat content_tag(:span, text)
    end
  end
end
