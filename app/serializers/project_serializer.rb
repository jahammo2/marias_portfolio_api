class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :designation
end
