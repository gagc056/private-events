class User < ApplicationRecord

  has_secure_password
  has_many :events
  has_many :invitations

  scope: past, ->{ where(['date < ?', DateTime.now])}
  scope:upcoming, ->{ where(['date >?', DateTime.now])}
end
