module FancyLanguage
  module Hooks
    class ViewsLayoutsHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag(:fancy_language, :plugin => 'fancy_language')
      end
    end
  end
end
