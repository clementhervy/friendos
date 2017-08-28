class Payment < ApplicationRecord
  belongs_to :expenditure
  belongs_to :payer
end
