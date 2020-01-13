# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'cannot be blanck' do
      expect(subject).to_not be_valid
    end

    it 'needs a password that matches with a password confirmation' do
      subject.password = '12345678'
      subject.password_confirmation = '123abc'
      expect(subject).to_not be_valid
    end

    it 'needs a password that matches with a password confirmation' do
      subject.password = '12345678'
      subject.password_confirmation = '12345678'
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it 'has many events' do
      assc = described_class.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it 'has many attendings' do
      assc = described_class.reflect_on_association(:attendings)
      expect(assc.macro).to eq :has_many
    end

    it 'has many attended' do
      assc = described_class.reflect_on_association(:attended)
      expect(assc.macro).to eq :has_many
    end
  end
end
