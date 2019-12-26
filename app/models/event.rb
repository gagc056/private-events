class Event < ApplicationRecord
  belongs_to :user, class_name: 'Creator', foreign_key: 'creator_id'
end
