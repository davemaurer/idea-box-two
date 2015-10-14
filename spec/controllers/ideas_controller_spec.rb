require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  it 'has an ideas index' do
    get :index

    expect(response.status).to eq(200)
  end
end
