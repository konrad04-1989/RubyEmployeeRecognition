# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # rubocop:disable RSpec/ExampleLength

  it 'enables me to sign up' do
    employee = build(:employee)
    visit root_path
    click_link 'Register'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'Sign up'
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'enables me to sign in' do
    employee = create(:employee)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  # rubocop:enable RSpec/ExampleLength
end
