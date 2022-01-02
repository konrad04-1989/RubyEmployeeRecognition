# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kudos/index', type: :view do
  before do
    assign(:kudos, [
             Kudo.create!(
               title: 'Title',
               content: 'MyText',
               giver_id: 2,
               receiver_id: 3
             ),
             Kudo.create!(
               title: 'Title',
               content: 'MyText',
               giver_id: 2,
               receiver_id: 3
             )
           ])
  end

  it 'renders a list of kudos' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
