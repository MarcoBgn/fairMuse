class Role < ActiveRecord::Base
  belongs_to :user

  def self.check_artist
    Role.where(user_id: id).artist
  end
  def self.check_subscriber(id)
    Role.where(user_id: id).subscriber
  end
end
