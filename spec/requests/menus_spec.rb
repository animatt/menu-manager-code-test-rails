require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/menus"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /1" do
    it "returns http success" do
      Menu.create(name: "Desert")
      get "/menus/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/menus/new"
      expect(response).to have_http_status(:success)
    end
  end
end
