require "rails_helper"

describe "Admin creates a new project" do
  describe "POST /api/projects" do
    let(:new_project_params) {
      {
        name: Faker::Company.catch_phrase, 
        body: Faker::Lorem.paragraph(1), 
        designation: "mobile"
      }
    }

    it "will return project JSON successfully if parameters are valid" do
      post '/api/projects', new_project_params

      ap new_project_params.name
      ap new_project_params.name
      expect(JSON.parse(response.body)["project"]).to eq(
        "name" => new_project_params.name,
        "body" => new_project_params.body,
        "designation" => "mobile"
      )
    end
  end
end
