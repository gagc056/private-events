class User < ApplicationRecord
  has_many :events
  has_many :invitations

  def previous_events
    
  end

  def upcoming_events
  end
end
