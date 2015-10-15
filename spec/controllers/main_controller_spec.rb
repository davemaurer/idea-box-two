require 'rails_helper'

RSpec.describe MainController, type: :controller do
  it 'has an main index' do
    get :index

    expect(response.status).to eq(200)
  end
end
