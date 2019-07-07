class LanguagesController < ApplicationController
  layout 'admin'
  before_action :require_admin

  def index

  end

  def save
    raise I18n.backend.reload!.inspect
  end
end
