class Attending < ApplicationRecord

  

  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :attended, foreign_key: 'attended_id', class_name: 'Event'
end
