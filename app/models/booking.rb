class Booking < ActiveRecord::Base
  has_one :contribution
  after_save :notify_provider

  private
  def notify_provider
    @provider = self.contribution.provider
    UserNotification.notification(@provider).deliver_now
  end
end
