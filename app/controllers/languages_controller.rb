class LanguagesController < ApplicationController
  def index
    raise I18n.backend.reload!.inspect
  end
end
