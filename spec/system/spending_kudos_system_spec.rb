# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudo management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee) { create(:employee, number_of_available_kudos: 1) }
  let!(:company_value) { create(:company_value) }
  let(:new_kudo) { build(:kudo) }
  let(:another_kudo) { build(:kudo) }

  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to spend all available kudos.' do
    sign_in(employee)

    visit(new_kudo_path)
    fill_in('kudo[title]', with: new_kudo.title)
    fill_in('kudo[content]', with: new_kudo.content)
    select(employee.email)
    select(company_value.title)
    click_button('Create Kudo')
    expect(page).to have_text('Kudo was successfully created.')
    expect(page).to have_text(new_kudo.title)

    visit(new_kudo_path)
    fill_in('kudo[title]', with: another_kudo.title)
    fill_in('kudo[content]', with: another_kudo.content)
    select(employee.email)
    select(company_value.title)
    click_button('Create Kudo')
    expect(page).to have_text('Sorry, you cannot give another Kudo.')
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
