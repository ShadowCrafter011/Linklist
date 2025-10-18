class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("info@linklist.ch", "LinkList")
  layout "mailer"
end
