# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:reward) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    it { is_expected.to validate_length_of(:title).is_at_least(2) }
    it { is_expected.to validate_length_of(:description).is_at_least(2) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end
end
