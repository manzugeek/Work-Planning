require 'rails_helper'

RSpec.describe "Shifts", type: :request do
  let(:worker) { FactoryBot.create(:worker) }
  
  describe "GET /index" do
    
    it "returns http success" do
      get "workers/#{worker.id}/shifts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "workers/#{worker.id}/shifts/new"
      expect(response).to have_http_status(:success)
    end
  end

end
