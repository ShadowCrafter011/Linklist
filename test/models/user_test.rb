require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email obfuscation" do
    emails = [
      [ "abc@gmail.com", "a*c@*****.***" ],
      [ "longer_email@bluewin.com", "l**********l@*******.***" ],
      [ "hello@yahoo.mail", "h***o@*****.****" ]
    ]
    emails.each do |email|
      user = User.new(email: email[0])
      assert_equal user.obfuscated_email, email[1]
    end
  end
end
