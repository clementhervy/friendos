class Expenditure < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :group
  has_many :payments
  has_and_belongs_to_many :categories
  monetize :amount_cents
  monetize :amount_per_group_member_cents
  monetize :total_payed_cents

  def amount_per_group_member_cents
    amount / group.users.count
  end

  def total_payed_cents
    payments.each do |p|
      total + p.amount
    end
  end

  def display_categories
    categories.join('; ')
  end
end
