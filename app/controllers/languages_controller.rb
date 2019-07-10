class LanguagesController < ApplicationController
  layout 'admin'
  before_action :require_admin

  def index
    @current_language = params[:language] ? params[:language] : User.current.language
    @valid_languages = FancyLanguage.app_languages_with_label
    @plugins = Redmine::Plugin.all
    @language_content = params[:plugin] ? FancyLanguage.read_plugin_language_file_content(params[:plugin],
        params[:language] ? params[:language] : @current_language
    ) : FancyLanguage.read_app_language_file_content(
        params[:language] ? params[:language] : @current_language
    )
  end

  def save
    raise I18n.backend.reload!.inspect
  end
end
