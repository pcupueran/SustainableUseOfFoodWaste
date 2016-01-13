class Provider < User
  has_many :contributions, foreign_key: 'user_id'

  def self.find_providers(providers_with_contributions, addresses)
    providers = []
    providers_with_contributions.each do |provider|
      addresses.each do |address|
        if provider == address.profile.user
          providers << address.profile.user
          break
        end
      end
    end
    providers
  end
end
