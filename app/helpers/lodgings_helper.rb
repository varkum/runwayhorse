module LodgingsHelper
  def google_maps_link(text:, address:)
    base_url = "https://www.google.com/maps/search/?api=1&query="
    encoded_address = URI.encode_www_form_component(address)
    link_to text, "#{base_url}#{encoded_address}", class: "text-blue-500 text-sm", target: "_blank"
  end
end
