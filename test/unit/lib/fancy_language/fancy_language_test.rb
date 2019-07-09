# run with *rails db:environment:set RAILS_ENV=development && rake redmine:plugins:test*

class FancyLanguageTest < ActiveSupport::TestCase

  def test_read_app_language_file_content
    assert_equal FancyLanguage.read_app_language_file_content.class.to_s, Hash.new.class.to_s
  end

end