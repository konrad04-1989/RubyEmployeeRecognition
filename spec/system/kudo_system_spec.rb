# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudo management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # rubocop:disable RSpec/ExampleLength

  it 'enables me to create, edit and destroy kudos' do
    FactoryBot.create :employee,  email: 'test3@test.pl',
                                  password: 'zaq123',
                                  password_confirmation: 'zaq123'

    visit root_path
    click_on 'Log in'
    fill_in 'employee[email]', with: 'test3@test.pl'
    fill_in 'employee[password]', with: 'zaq123'
    click_button 'Log in'

    visit '/kudos/new'
    fill_in 'kudo[title]', with: 'Test Title of Kudo'
    fill_in 'kudo[content]', with: 'Test Content '
    select 'test3@test.pl'
    click_button 'Create Kudo'

    expect(page).to have_text('Kudo was successfully created.')

    visit '/kudos'
    click_on 'Edit...'
    fill_in 'kudo[title]', with: 'Edited Test Title of Kudo'
    click_button 'Update Kudo'

    expect(page).to have_text('Kudo was successfully updated.')

    visit '/kudos'
    click_on 'Destroy!'

    expect(page).to have_text('Kudo was successfully destroyed.')
  end

  # rubocop:enable RSpec/ExampleLength
end
