# Preview all emails at http://localhost:3000/rails/mailers/password_resets_mailer
class PasswordResetsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password_resets_mailer/reset
  def reset
    PasswordResetsMailer.reset
  end

end
