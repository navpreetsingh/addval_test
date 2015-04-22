require 'rails_helper'

RSpec.describe InformationController, type: :controller do

  describe "GET #piece" do
    it "returns http success" do
      get :piece
      expect(response).to have_http_status(:success)
    end
  end

end
