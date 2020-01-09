# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: 'creator_id'
  has_many :attendings, foreign_key: 'attendee_id'
  has_many :attended, through: :attendings, class_name: 'Event'
end
