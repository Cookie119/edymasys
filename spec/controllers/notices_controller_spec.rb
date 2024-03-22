RSpec.describe NoticesController, type: :controller do
  let(:category) { create(:category) }
  
  describe "GET #show" do
    it "returns http success" do
      notice = create(:notice, category: category)
      get :show, params: { id: notice.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      notice = create(:notice, category: category)
      get :show, params: { id: notice.id }
      expect(response).to render_template(:show)
    end

    it "assigns the requested notice to @notice" do
      notice = create(:notice, category: category)
      get :show, params: { id: notice.id }
      expect(assigns(:notice)).to eq(notice)
    end

    it "renders a PDF for the notice" do
      notice = create(:notice, category: category)
      get :show, params: { id: notice.id, format: :pdf }
      expect(response.content_type).to eq("application/pdf")
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) { { notice: attributes_for(:notice, category_id: category.id) } }

      it "creates a new notice" do
        expect {
          post :create, params: valid_params
        }.to change(Notice, :count).by(1)
      end

      it "redirects to the created notice" do
        post :create, params: valid_params
        expect(response).to redirect_to(notice_url(Notice.last))
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { notice: attributes_for(:notice, title: nil) } }

      it "does not create a new notice" do
        expect {
          post :create, params: invalid_params
        }.not_to change(Notice, :count)
      end

      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end
