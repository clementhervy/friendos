class Payment < ApplicationRecord
  belongs_to :expenditure
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  monetize :amount_cents
end
