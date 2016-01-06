class UserNotification < ApplicationMailer

  def notification(provider, charity)
    @charity = charity
    @provider = provider
    mail(to: provider.email, subject: 'The following charity has booked this contribution')
  end
end
