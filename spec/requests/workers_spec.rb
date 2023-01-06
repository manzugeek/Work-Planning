require "rails_helper"

RSpec.describe "Worker routes", type: :request do
  describe "GET /workers" do
    it "renders the workers index template" do
      get "/workers"
      expect(response).to render_template("index")
    end
  end

  describe "GET /users/:user_id/workers/new" do
    it "renders the new worker template" do
      user = FactoryBot.create(:user)
      get "/users/#{user.id}/workers/new"
      expect(response).to render_template("new")
    end
  end

  describe "POST /users/:user_id/workers" do
    it "creates a new worker record" do
      user = FactoryBot.create(:user)
      expect {
        post "/users/#{user.id}/workers", params: { worker: attributes_for(:worker) }
      }.to change(Worker, :count).by(1)
      expect(response).to redirect_to("/workers/#{Worker.last.id}")
    end
  end

  describe "GET /workers/:worker_id/shifts/new" do
    it "renders the new shift template" do
      worker = FactoryBot.create(:worker)
      get "/workers/#{worker.id}/shifts/new"
      expect(response).to render_template("new")
    end
  end
end
  
