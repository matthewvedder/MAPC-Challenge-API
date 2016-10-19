class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, :project_name, :organization_name, presence: true
end
