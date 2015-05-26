require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #error" do
    it "returns http success" do
      get :error
      expect(response).to have_http_status(:success)
    end
  end

end
