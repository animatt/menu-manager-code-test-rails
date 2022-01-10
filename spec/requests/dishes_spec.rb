require 'rails_helper'

RSpec.describe "Dishes", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/dishes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      Dish.create(name: "Hamburger", price: 20.00)
      get "/dishes/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/dishes/new"
      expect(response).to have_http_status(:success)
    end
  end
end
