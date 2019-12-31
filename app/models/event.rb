class Event < ApplicationRecord
  before_validation :set_creator_id, on: :create

  belongs_to :user

  private
  def set_creator_id
    self.user_id = cookies[:user_id].to_i
  
  end
end
