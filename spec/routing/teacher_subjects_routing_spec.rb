require "rails_helper"

RSpec.describe TeacherSubjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/teacher_subjects").to route_to("teacher_subjects#index")
    end

    it "routes to #new" do
      expect(get: "/teacher_subjects/new").to route_to("teacher_subjects#new")
    end

    it "routes to #show" do
      expect(get: "/teacher_subjects/1").to route_to("teacher_subjects#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/teacher_subjects/1/edit").to route_to("teacher_subjects#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/teacher_subjects").to route_to("teacher_subjects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/teacher_subjects/1").to route_to("teacher_subjects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/teacher_subjects/1").to route_to("teacher_subjects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/teacher_subjects/1").to route_to("teacher_subjects#destroy", id: "1")
    end
  end
end
