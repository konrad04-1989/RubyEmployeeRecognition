# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudo management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee) }
  let!(:company_value) { create(:company_value) }
  let(:new_kudo) { build(:kudo) }
  let(:edited_kudo) { build(:kudo) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to create, edit and destroy kudos' do
    sign_in(employee)
    visit(new_kudo_path)

    fill_in('kudo[title]', with: new_kudo.title)
    fill_in('kudo[content]', with: new_kudo.content)
    select(employee.email)
    click_button('Create Kudo')
    expect(page).to have_text('Company value must exist')
    select(company_value.title)
    click_button('Create Kudo')
    expect(page).to have_text('Kudo was successfully created.')

    visit(kudos_path)
    click_on('Edit...')
    fill_in('kudo[title]', with: edited_kudo.title)
    click_button('Update Kudo')
    expect(page).to have_text('Kudo was successfully updated.')

    visit(kudos_path)
    click_on('Destroy!')
    expect(page).to have_text('Kudo was successfully destroyed.')
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
