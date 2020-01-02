class Invitation < ApplicationRecord
  belongs_to :user, class_name: 'Creator', foreign_key: 'creator_id'
  has_many :invitation
  belongs_to :event
  validate :not_attending

end
