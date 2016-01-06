class UserNotification < ApplicationMailer
  def notification(provider)
    @provider = provider
    mail(to: provider.email, subject: 'The following charity has booked this contribution')
  end
end
