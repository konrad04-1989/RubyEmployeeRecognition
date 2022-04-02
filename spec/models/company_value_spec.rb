# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyValue, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:company_value) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    it { is_expected.to validate_length_of(:title).is_at_least(2) }
  end
end
