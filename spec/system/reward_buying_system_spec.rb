# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reward management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee) }
  let!(:reward) { create(:reward, price: 1) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to purchase a reward.' do
    create(:kudo, receiver_of_kudo: employee)
    sign_in(employee)
    visit(rewards_path)

    expect(page).to have_text(reward.title)
    expect(employee.number_of_points).to be(1)

    find('tr', text: reward.title).click_on('Buy')
    expect(page).to have_text(reward.title)
    expect(page).to have_text('Reward was successfully purchased.')
    expect(employee.number_of_points).to be(0)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
