class LanguagesController < ApplicationController
  layout 'admin'
  before_action :require_admin

  def index
    @current_language = params[:language] ? params[:language] : User.current.language
    @valid_languages = FancyLanguage.app_languages_with_label
    @plugins = Redmine::Plugin.all
    @current_plugin = params[:plugin]
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

  def save
    raise I18n.backend.reload!.inspect
  end

  def plugin
    current_plugin = params[:plugin]
    # TODO
  end
end
