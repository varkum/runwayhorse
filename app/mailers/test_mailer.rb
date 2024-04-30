class TestMailer < ApplicationMailer
  default from: 'hello@runwayhorse.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.hello.subject
  #
  def hello
      mail(
        subject: 'Hello from Postmark',
        to: 'hello@runwayhorse.com',
        from: 'hello@runwayhorse.com',
        html_body: '<strong>Hello</strong> dear Postmark user.',
        track_opens: 'false',
        message_stream: 'outbound')
  end
end
