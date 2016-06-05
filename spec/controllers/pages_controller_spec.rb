require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:current_user) { create :user }

  before do
    sign_in current_user
  end

  describe "GET show" do
    let(:page) { create :page }

    it "returns http success" do
      get :show, params: { id: page.id }
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

  describe "POST create" do
    let(:params) do
      {
        page: {
          title: 'タイトル',
          body: '本文'
        }
      }
    end

    it "creates a post and redirect" do
      post :create, params: params
      expect(response).to have_http_status(:redirect)

      page = Page.last
      expect(page.title).to eq 'タイトル'
      expect(page.body).to eq '本文'

      expect(response).to redirect_to page_path(page)
    end

    context 'without title' do
      before do
        params[:page][:title] = ''
      end

      it 'renders validations errors' do
        post :create, params: params
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
        expect(assigns(:page)).to_not be_persisted
        expect(assigns(:errors)).to be_present
      end
    end
  end

  describe "GET index" do
    let!(:page) { create :page }

    it "returns pages" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:pages)).to eq [page]
    end
  end
end
