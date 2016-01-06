class Booking < ActiveRecord::Base
  belongs_to :charity
  belongs_to :contribution
  after_save :notify_provider

  private
  def notify_provider
    @charity = self.charity
    @provider = self.contribution.provider
    UserNotification.notification(@provider, @charity).deliver_now
  end
end
