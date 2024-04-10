module ApplicationHelper
  def human_date(date, no_year: false)
    no_year ? date.strftime("%B %e") : date.strftime("%B %e, %Y")
  end
  
  def human_time(time)
    time&.strftime("%l:%M %p")
  end
  
  def icon_for(transport_mode, size: '8')
    image_tag "#{transport_mode}.svg", class: "h-6 sm:h-#{size} w-auto mx-auto sm:mb-2"
  end
end
