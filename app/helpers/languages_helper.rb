module LanguagesHelper

  def print_hash(h, parent = '', spaces = 12, level = 0)
    tree = ""
    h.each do |key, val|
      parent_key = parent.empty? ? "[#{key}]" : "#{parent}[#{key}]"
      format = content_tag(:span, "#{key}:", {style: "font-weight: bold;"})
      if val.is_a? Hash
        tree << content_tag(:div, format, {style: "padding-left: #{spaces * level}px;"})
        tree << print_hash(val, parent_key, spaces, level + 1)
      else
        tree << content_tag(:div, format + " " + print_field(parent_key, val.to_s), {style: "padding-left: #{spaces * level}px;"})
      end
    end
    tree
  end

  def print_field(key, val)
    text_field_tag(key, val, {id: key.gsub('][', '_').gsub(']', '').gsub('[', '')})
  end

end
