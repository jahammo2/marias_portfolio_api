class Project < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :body, presence: true
  validates :designation, presence: true
end
