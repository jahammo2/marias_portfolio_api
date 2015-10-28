require "rails_helper"

describe "Admin creates a new project" do
  describe "POST /api/projects" do
    let(:new_project_params) {
      {
        project: {
          name: Faker::Company.catch_phrase, 
          body: Faker::Lorem.paragraph(1), 
          designation: "mobile"
        }
      }
    }

    it "will return project JSON successfully if parameters are valid" do
      post '/api/projects', new_project_params

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["project"]).to include(
        "name" => new_project_params[:project][:name],
        "body" => new_project_params[:project][:body],
        "designation" => "mobile"
      )
    end

    it "will return project errors if parameter is missing" do
      new_project_params[:project][:name] = nil

      post '/api/projects', new_project_params

      expect(response.status).to eq 401
      expect(JSON.parse(response.body)).to include(
        "errors"=> {
          "name" => ["can't be blank"]
        }
      )
    end

    it "will return a 401 if project already exists" do
      create(:project, name: "string")
      new_project_params[:project][:name] = "string"

      post '/api/projects', new_project_params

      expect(response.status).to eq 401
      expect(JSON.parse(response.body)).to include(
        "errors"=> {
          "name" => ["has already been taken"]
        }
      )
    end
  end
end
