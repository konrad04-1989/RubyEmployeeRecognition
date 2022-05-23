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
  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
