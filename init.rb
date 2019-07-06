Redmine::Plugin.register :fancy_language do
  name 'Fancy Language'
  author 'Anderson Alvarez V'
  description 'A plugin for editing the all languages in redmine, without the necessity to restart the rails server'
  version '0.0.1'
  url 'http://fancy-redmine.com/language'
  author_url 'http://andersonav91.com/'
  menu :admin_menu, :languages, {:controller => 'languages', :action => 'index'}, :caption => :label_language_plural,
       :html => {:class => 'icon icon-languages'}
end
