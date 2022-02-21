# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin account management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # rubocop:disable RSpec/ExampleLength
  it 'enables Admin to sign in' do
    admin = create(:admin)
    visit root_path
    click_link 'Admin Log in'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end
  # rubocop:enable RSpec/ExampleLength
end
