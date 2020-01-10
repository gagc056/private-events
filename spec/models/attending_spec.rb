require 'rails_helper'

RSpec.describe Attending, type: :model do
  describe 'Associations' do
    it 'belongs to attendee' do
      assc = described_class.reflect_on_association(:attendee)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to attended' do
      assc = described_class.reflect_on_association(:attended)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
