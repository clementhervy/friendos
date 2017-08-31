class User < ApplicationRecord
  include Clearance::User
  has_and_belongs_to_many :groups
  has_many :expenditures
  has_many :payments
end
