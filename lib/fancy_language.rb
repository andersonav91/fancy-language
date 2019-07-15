
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

    def app_languages_with_label
      valid_languages.select {|locale| ::I18n.exists?(:general_lang_name, locale)}.
          map {|lang| [ll(lang.to_s, :general_lang_name), lang.to_s]}.
          sort_by(&:first)
    end

    def plugin_languages
      # TODO
    end

    def plugin_languages
      # TODO
    end

  end

end