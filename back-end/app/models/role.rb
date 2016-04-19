class Role < ActiveRecord::Base
  belongs_to :user

  def check_artist(id)
    Role.where(user_id: id).artist
  end
  def check_subscriber(id)
    Role.where(user_id: id).subscriber
  end
end
