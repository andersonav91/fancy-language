require 'yaml'

class LanguagesController < ApplicationController

  layout 'admin'

  self.main_menu = false

  before_action :require_admin

  before_action :load_language_from_params, only: [:index, :plugin]

  def index
  end

  def update
    document = params[:document].to_yaml
    # TODO: Add the path of the file to the params and save the file
    File.open("language.yml", "w") { |file| file.write(document) }
    raise params[:document].to_yaml.inspect
    raise I18n.backend.reload!.inspect
  end

  def plugin
  end

  private

  def load_language_from_params
    @current_language = params[:language] ? params[:language] : User.current.language
    @plugins = Redmine::Plugin.all
    @current_plugin = (params[:plugin] && ! params[:plugin].empty?) ? params[:plugin] : nil
    if @current_plugin
      @valid_languages = FancyLanguage.plugin_languages_with_label(@current_plugin)
    else
      @valid_languages = FancyLanguage.app_languages_with_label
    end
    begin
      @language_content = @current_plugin ? FancyLanguage.read_plugin_language_file_content(@current_plugin,
          params[:language] ? params[:language] : @current_language
      ) : FancyLanguage.read_app_language_file_content(
          params[:language] ? params[:language] : @current_language
      )
    rescue
      @language_content = FancyLanguage.read_app_language_file_content(
          params[:language] ? params[:language] : @current_language
      )
      flash.now[:error] = l(:error_invalid_plugin_language_file, plugin: @current_plugin, language: @current_language)
      @current_plugin = nil
    end
  end
end
