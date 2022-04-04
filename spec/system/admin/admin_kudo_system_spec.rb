# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Kudo management', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin_user) { create(:admin_user) }
  let!(:kudo) { create(:kudo) }
  let!(:kudo1) { create(:kudo) }
  # rubocop:disable RSpec/ExampleLength
  # rubocop:disable RSpec/MultipleExpectations

  it 'enables me to show and destroy kudos' do
    login_as(admin_user)
    visit admin_kudos_path

    expect(page).to have_text(kudo.title)
    expect(page).to have_text(kudo1.title)

    find_button('Destroy!', match: :first).click
    expect(page).to have_text('Kudo was successfully destroyed.')
    expect(page).not_to have_text(kudo.title)
  end

  # rubocop:enable RSpec/ExampleLength
  # rubocop:enable RSpec/MultipleExpectations
end
