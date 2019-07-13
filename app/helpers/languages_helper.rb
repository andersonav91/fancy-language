module LanguagesHelper

  def print_hash(h, spaces = 12, level = 0)
    tree = ""
    h.each do |key, val|
      format = content_tag(:span, "#{key}:", {style: "font-weight: bold;"})
      if val.is_a? Hash
        tree << content_tag(:div, format, {style: "padding-left: #{spaces * level}px;"})
        tree << print_hash(val, spaces, level + 1)
      else
        tree << content_tag(:div, format + " " + print_field(key, val.to_s), {style: "padding-left: #{spaces * level}px;"})
      end
    end
    tree
  end

  def print_field(key, val)
    text_field_tag(key, val)
  end

end
