require "rails_helper"

RSpec.describe WeeklyTimetablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weekly_timetables").to route_to("weekly_timetables#index")
    end

    it "routes to #new" do
      expect(get: "/weekly_timetables/new").to route_to("weekly_timetables#new")
    end

    it "routes to #show" do
      expect(get: "/weekly_timetables/1").to route_to("weekly_timetables#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/weekly_timetables/1/edit").to route_to("weekly_timetables#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weekly_timetables").to route_to("weekly_timetables#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weekly_timetables/1").to route_to("weekly_timetables#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weekly_timetables/1").to route_to("weekly_timetables#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weekly_timetables/1").to route_to("weekly_timetables#destroy", id: "1")
    end
  end
end
