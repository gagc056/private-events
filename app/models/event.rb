# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  has_many :attendings, foreign_key: 'attended_id'
  has_many :attendees, through: :attendings, class_name: 'User'

  scope :past, -> { where('date < :current_time', current_time: DateTime.now) }
  scope :upcoming, -> { where('date >= :current_time', current_time: DateTime.now) }
end
