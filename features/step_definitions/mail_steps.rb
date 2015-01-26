Then(/^the NFA adaptor will reject package and I should receive an email with the subject$/) do |text|
  email = WebMail.new
  email.init_email("testn09", "testlead01")
  email.subject(text)
end

And(/^I should receive an email with the subject$/) do |text|
  email = WebMail.new
  email.init_email("testn09", "testlead01")
  email.subject(text)
end