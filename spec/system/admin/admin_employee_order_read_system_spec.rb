# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Reward management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:employee) { create(:employee) }
  let(:admin_user) { create(:admin_user) }
  let!(:order) { create(:order, employee: employee) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables Admin to see list of rewards bought by the employee' do
    sign_in(admin_user)
    visit(admin_employees_path)
    click_on('Show')
    expect(page).to have_text('History of bought rewards')
    expect(page).to have_text(order.snapshot.title)
    expect(page).to have_text(order.snapshot.description)
    expect(page).to have_text(order.snapshot.price)
  end

  it 'enables Admin to deliver rewards to the employees' do
    sign_in(admin_user)
    visit(admin_orders_path)
    expect(order.status).to eq('not_delivered')
    expect(order.status).not_to eq('delivered')
    click_on('Deliver')
    expect(page).to have_text('Order delivered')
    visit current_path
    order.reload
    expect(order.status).to eq('delivered')
    expect(order.status).not_to eq('not_delivered')
    expect(page).not_to have_selector(:link_or_button, 'Deliver')
    expect(page).not_to have_text('Order delivered')
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
