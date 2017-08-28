class Expenditure < ApplicationRecord
  belongs_to :payer
  belongs_to :group
  has_many :payments
  has_many :categories
end
