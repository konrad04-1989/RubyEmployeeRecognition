require 'rails_helper'

RSpec.describe 'kudos/show', type: :view do
  before do
    @kudo = assign(:kudo, Kudo.create!(
                            title: 'Title',
                            content: 'MyText',
                            giver_id: 2,
                            receiver_id: 3
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
