module ApplicationHelper
  def human_date(date, no_year: false, show_day: false)
    return "No date" if date.nil?
    no_year ? date.strftime("%A, %B %e") : date.strftime("%B %e, %Y")
  end

  def human_time(time)
    time&.strftime("%l:%M %p")
  end

  def icon_for(transport_mode, size: "10")
    image_tag "#{transport_mode}.svg", class: "h-6 sm:h-#{size} w-auto mx-auto"
  end
  
  def link_to_if_with_style(condition, name, destination, **options)
    if condition
      link_to name, destination, **options
    else
      link_to name, "#", **options
    end
  end
end
