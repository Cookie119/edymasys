require 'rails_helper'

RSpec.describe MasterTimetablesController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:master_timetable) }

  let(:invalid_attributes) do
    {
      day_id: nil,
      time_slot_id: nil,
      subject_id: nil,
      division_id: nil,
      teacher_id: nil
    }
  end

  describe "GET #index" do
    it "returns a success response" do
      master_timetable = MasterTimetable.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      master_timetable = MasterTimetable.create! valid_attributes
      get :show, params: { id: master_timetable.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MasterTimetable" do
        expect {
          post :create, params: { master_timetable: valid_attributes }
        }.to change(MasterTimetable, :count).by(1)
      end

      it "redirects to the created master_timetable" do
        post :create, params: { master_timetable: valid_attributes }
        expect(response).to redirect_to(MasterTimetable.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { master_timetable: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested master_timetable" do
      master_timetable = MasterTimetable.create! valid_attributes
      expect {
        delete :destroy, params: { id: master_timetable.to_param }
      }.to change(MasterTimetable, :count).by(-1)
    end

    it "redirects to the master_timetables list" do
      master_timetable = MasterTimetable.create! valid_attributes
      delete :destroy, params: { id: master_timetable.to_param }
      expect(response).to redirect_to(master_timetables_url)
    end
  end
end
