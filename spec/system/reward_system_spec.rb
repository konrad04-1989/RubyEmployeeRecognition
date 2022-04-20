# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reward management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee) }
  let!(:reward) { create(:reward) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'displays rewards index and shows reward page' do
    sign_in(employee)
    visit(rewards_path)

    expect(page).to have_text(reward.title)
    expect(page).not_to have_text(reward.description)

    find('tr', text: reward.title).click_on('Show')
    expect(page).to have_text(reward.title)
    expect(page).to have_text(reward.description)
    expect(page).to have_text(reward.price)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
