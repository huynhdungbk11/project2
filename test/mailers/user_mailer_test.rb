require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
    def sample_mail_preview
    UserMailer.sample_email(User.first)
  end

end
