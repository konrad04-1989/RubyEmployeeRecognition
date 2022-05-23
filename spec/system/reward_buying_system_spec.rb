# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reward management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee) }
  let(:admin_user) { create(:admin_user) }
  let!(:reward) { create(:reward, price: 1) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations
  # rubocop:disable Lint/Void

  it 'enables me to purchase a reward and displays bought rewards index' do
    create(:kudo, receiver_of_kudo: employee)
    sign_in(employee)
    visit(rewards_path)

    expect(page).to have_text(reward.title)
    expect(employee.number_of_points) == 1

    find('tr', text: reward.title).click_on('Buy')
    expect(employee.number_of_points) == 0
    expect(page).to have_text('Reward was successfully purchased.')

    visit(orders_path)
    expect(page).to have_text('Orders List')
    expect(page).to have_text(reward.title)
    expect(page).to have_text(reward.price)
    expect(page).to have_text(reward.description)
  end

  it 'enables me to purchase a reward and keep its original price despite changes' do
    create(:kudo, receiver_of_kudo: employee)
    sign_in(employee)
    visit(rewards_path)
    find('tr', text: reward.title).click_on('Buy')
    visit(orders_path)
    expect(page).to have_text(reward.price)
    expect(reward.price) == 1

    sign_in(admin_user)
    visit(admin_rewards_path)
    click_on('Edit...', match: :first)
    fill_in('reward[price]', with: 10)
    click_on('Update Reward')
    expect(reward.price) == 10

    visit(orders_path)
    expect(page).to have_text(reward.title)
    expect(page).to have_text(reward.description)
    expect(page).to have_text(reward.price)
    expect(reward.price) == 1
  end

  # rubocop:enable Lint/Void
  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
