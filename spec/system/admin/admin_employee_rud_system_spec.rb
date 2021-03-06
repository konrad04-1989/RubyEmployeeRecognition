# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Employee management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin_user) { create(:admin_user) }
  let!(:employee) { create(:employee) }
  let!(:employee1) { create(:employee) }
  let!(:employee2) { build(:employee) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to read, update and destroy employee' do
    sign_in(admin_user)
    visit(admin_employees_path)

    expect(page).to have_text(employee.email)
    expect(page).to have_text(employee1.email)

    click_link('Edit...', match: :first)
    fill_in('Email', with: employee2.email)
    click_button('Update Employee')
    expect(page).to have_text('Employee was successfully updated.')
    expect(page).to have_text(employee2.email)

    click_button('Destroy', match: :first)
    click_button('Destroy')
    expect(page).to have_text('Employee was successfully destroyed.')
    expect(page).not_to have_text(employee.email)
    expect(page).not_to have_text(employee1.email)
    expect(page).not_to have_text(employee2.email)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
