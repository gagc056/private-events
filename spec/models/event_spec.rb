# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) do
    User.create(
      name: 'Jhon',
      email: 'jhon@doe.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  end
  let(:event_with_user) { user.events.create }

  subject { described_class.new }

  describe 'Validations' do
    it 'cannot be blanck' do
      expect(subject).to_not be_valid
    end

    it 'needs an creator_id' do
      expect(event_with_user).to be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has many attendings' do
      assc = described_class.reflect_on_association(:attendings)
      expect(assc.macro).to eq :has_many
    end

    it 'has many attendees' do
      assc = described_class.reflect_on_association(:attendees)
      expect(assc.macro).to eq :has_many
    end
  end
end
