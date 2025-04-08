class UserMailer < ApplicationMailer
  def login_link(user, token)
    @user = user
    @token = token
    @magic_link = magic_link_url(user_id: user.id, token: token)
    
    mail(to: user.email, subject: 'Your magic login link for The Tin Admin')
  end
end