module ApplicationHelper
  def human_date(date)
    date.strftime("%B %e, %Y")
  end
  
  def icon_for(transport_mode, size: '8')
    image_tag "#{transport_mode}.png", class: "h-#{size} w-auto mx-auto mb-2"
  end
end
