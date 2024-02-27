module DaysHelper
  def show_button_or_value(value:, display_name:, icon:)
    if value.present?
      content_tag(:p, class: "h-6 w-auto") do
				concat(image_tag "#{icon}.svg", class: "h-6 w-auto")
				concat(content_tag(:span, value, class: "ml-1"))
      end
    else
			link_to edit_day_path, class: "flex items-center justify-center rounded-3xl px-4 py-2 text-white bg-blue-700" do
				concat(image_tag("#{icon}.svg", class: "h-6 w-auto mr-1"))
        concat(content_tag(:span, "Add #{display_name}", class: "text-sm font-light"))
			end
    end
  end
end
