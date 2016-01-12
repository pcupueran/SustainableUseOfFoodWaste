class Provider < User
  has_many :contributions, foreign_key: 'user_id'
end
