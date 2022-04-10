# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Reward management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin_user) { create(:admin_user) }
  let(:new_reward) { build(:reward) }
  let(:edited_reward) { build(:reward) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to create, read, update and destroy Reward' do
    sign_in(admin_user)
    visit(admin_rewards_path)

    click_link('Create New Reward!')
    fill_in('reward[title]', with: new_reward.title)
    fill_in('reward[description]', with: new_reward.description)
    fill_in('reward[price]', with: new_reward.price)
    click_button('Create Reward')
    expect(page).to have_text('Reward was successfully created.')
    expect(page).to have_text(new_reward.title)

    click_link('Edit...', match: :first)
    fill_in('reward[title]', with: edited_reward.title)
    click_button('Update Reward')
    expect(page).to have_text('Reward was successfully updated.')
    expect(page).to have_text(edited_reward.title)
    expect(page).not_to have_text(new_reward.title)

    click_button('Destroy', match: :first)
    expect(page).to have_text('Reward was successfully destroyed.')
    expect(page).not_to have_text(new_reward.title)
    expect(page).not_to have_text(edited_reward.title)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
