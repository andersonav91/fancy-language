Redmine::Plugin.register :fancy_language do
  name 'Fancy Language'
  author 'Anderson Alvarez V'
  description 'A plugin for editing the all languages in redmine, without the necessity of restart the rails server'
  version '0.0.1'
  url 'https://github.com/andersonav91/fancy-language'
  author_url 'https://www.linkedin.com/in/anderson-alvarez-vasquez/'
  menu :admin_menu, :languages, {:controller => 'languages', :action => 'index'}, :caption => :label_language_plural,
       :html => {:class => 'icon icon-languages'}
  requires_redmine :version_or_higher => '2.6'
end

require 'fancy_language'
