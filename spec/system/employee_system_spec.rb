# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # rubocop:disable ExampleLength

  it 'enables me to sign up' do
    visit root_path
    click_link 'Register'
    fill_in 'employee[email]', with: 'test@test.pl'
    fill_in 'employee[password]', with: 'zaq123'
    fill_in 'Password confirmation', with: 'zaq123'
    click_button 'Sign up'

    expect(page).to have_text('Logged as: test@test.pl')
  end

  it 'enables me to sign in' do
    FactoryBot.create :employee,  email: 'test2@test.pl',
                                  password: 'zaq123',
                                  password_confirmation: 'zaq123'

    visit root_path
    click_link 'Log in'
    fill_in 'employee[email]', with: 'test2@test.pl'
    fill_in 'employee[password]', with: 'zaq123'
    click_button 'Log in'

    expect(page).to have_text('Logged as: test2@test.pl')
  end

  # rubocop:enable ExampleLength
end
