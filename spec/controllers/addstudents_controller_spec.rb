require 'rails_helper'

RSpec.describe AddstudentsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      addstudent = create_addstudent
      get :show, params: { id: addstudent.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      addstudent = create_addstudent
      get :edit, params: { id: addstudent.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Addstudent" do
        expect {
          post :create, params: { addstudent: valid_attributes }
        }.to change(Addstudent, :count).by(1)
      end

      it "redirects to the created addstudent" do
        post :create, params: { addstudent: valid_attributes }
        expect(response).to redirect_to(Addstudent.last)
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable entity response" do
        post :create, params: { addstudent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { first_name: "New Name" }
    }

    context "with valid parameters" do
      it "updates the requested addstudent" do
        addstudent = create_addstudent
        put :update, params: { id: addstudent.id, addstudent: new_attributes }
        addstudent.reload
        expect(addstudent.first_name).to eq("New Name")
      end

      it "redirects to the addstudent" do
        addstudent = create_addstudent
        put :update, params: { id: addstudent.id, addstudent: valid_attributes }
        expect(response).to redirect_to(addstudent)
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable entity response" do
        addstudent = create_addstudent
        put :update, params: { id: addstudent.id, addstudent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  def create_addstudent
    Addstudent.create!(valid_attributes)
  end

  def valid_attributes
    {
      photograph: fixture_file_upload('photo.jpg', 'image/jpg'),
      first_name: "John",
      middle_name: "Doe",
      surname: "Smith",
      date_of_birth: Date.today,
      gender: "Male",
      phone_number: "1234567890",
      email: "john@example.com",
      address: "123 Main St, City",
      fathers_name: "David Doe",
      mothers_name: "Jane Doe",
      parents_phone_number: "0987654321",
      job_placement: "Engineer",
      marital_status: "Married",
      enrollment_number: generate_enrollment_number
    }
  end
  
  def generate_enrollment_number
    "unique_enrollment_number_#{SecureRandom.hex(4)}"
  end
  
  def invalid_attributes
    {
      first_name: "",
      middle_name: "Doe",
      surname: "Smith",
      date_of_birth: "invalid_date",
      gender: "",
      phone_number: "invalid_phone_number",
      email: "invalid_email",
      address: "",
      fathers_name: "",
      mothers_name: "",
      parents_phone_number: "invalid_phone_number",
      job_placement: "",
      marital_status: "",
      enrollment_number: ""
    }
  end
end
