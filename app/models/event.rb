class Event < ApplicationRecord
  belongs_to :user
  has_many :attendings, foreign_key: 'attended_id'
  has_many :attendees, through: :attendings, class_name: 'User'

end
