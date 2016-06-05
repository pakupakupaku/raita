require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:current_user) { create :user }

  before do
    sign_in current_user
  end

  describe "GET show" do
    let(:page) { create :page }

    it "returns http success" do
      get :show, id: page.id
      expect(response).to have_http_status(:success)
      expect(assigns(:page)).to eq page
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:page)).to be_a_new(Page)
    end
  end
end
