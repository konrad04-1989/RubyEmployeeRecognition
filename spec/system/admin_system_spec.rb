# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin account management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # rubocop:disable RSpec/ExampleLength
  it 'enables Admin to sign in' do
    admin_user = create(:admin_user)
    visit admin_root_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
    expect(page).to have_text('Admin#dashboard')
   end
  # rubocop:enable RSpec/ExampleLength
end
