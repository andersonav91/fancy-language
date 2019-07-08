
require 'fancy_language/hooks/views_layouts_hook'
require 'yaml'

module FancyLanguage

  SOME_CONSTANT = 1

  class << self

    include Redmine::I18n

    def read_app_language_file_content(language = :en)
      content = YAML.load_file(File.join(Rails.root, 'config', 'locales', "#{language}.yml"))
      content
    end

    def read_plugin_language_file_content(plugin, language = :en)
      plugin = Redmine::Plugin.find(plugin)
      content = YAML.load_file(File.join(plugin.directory, 'config', 'locales', "#{language}.yml"))
      content
    end
    
    def app_languages
      valid_languages
    end
    
  end

end