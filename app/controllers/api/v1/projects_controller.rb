module Api
  module V1
    class ProjectsController < Api::V1::ApiController
      def create
        project = Project.new(project_params)

        if project.save
          render json: project,
                 status: 200
        else
          render json: {errors: project.errors},
                 status: 401
        end
      end

      private
      def project_params
        params.require(:project).permit(:name, :body, :designation)
      end
    end
  end
end
