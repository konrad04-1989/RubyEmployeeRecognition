# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee) }
  let!(:order1) { create(:order, employee: employee, status: 'delivered') }
  let!(:order2) { create(:order, employee: employee, status: 'not_delivered') }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to index orders and filter them' do
    sign_in(employee)
    visit(orders_path)

    expect(page).to have_selector(:link_or_button, 'All')
    expect(page).to have_selector(:link_or_button, 'Delivered')
    expect(page).to have_selector(:link_or_button, 'Not delivered')
    click_on('Delivered')
    expect(page).to have_text(order1.snapshot.title)
    expect(page).not_to have_text(order2.snapshot.title)
    click_on('Not delivered')
    expect(page).not_to have_text(order1.snapshot.title)
    expect(page).to have_text(order2.snapshot.title)
    click_on('All')
    expect(page).to have_text(order1.snapshot.title)
    expect(page).to have_text(order2.snapshot.title)
  end
  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
