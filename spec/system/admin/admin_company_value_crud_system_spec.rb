# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Company Value management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin_user) { create(:admin_user) }
  let(:new_company_value) { build(:company_value) }
  let(:edited_company_value) { build(:company_value) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to create, read, update and destroy Company Value' do
    sign_in(admin_user)
    visit(admin_company_values_path)

    click_link('Create New Company Value!')
    fill_in('company_value[title]', with: new_company_value.title)
    click_button('Create Company value')
    expect(page).to have_text('Company Value was successfully created.')
    expect(page).to have_text(new_company_value.title)

    click_link('Edit...', match: :first)
    fill_in('company_value[title]', with: edited_company_value.title)
    click_button('Update Company value')
    expect(page).to have_text('Company Value was successfully updated.')
    expect(page).to have_text(edited_company_value.title)
    expect(page).not_to have_text(new_company_value.title)

    click_button('Destroy', match: :first)
    expect(page).to have_text('Company Value was successfully destroyed.')
    expect(page).not_to have_text(new_company_value.title)
    expect(page).not_to have_text(edited_company_value.title)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
