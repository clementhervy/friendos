class ChangeAmountMoneyRails < ActiveRecord::Migration[5.1]
  def change
    rename_column :expenditures, :amount, :amount_cents
    rename_column :payments, :amount, :amount_cents
    remove_column :expenditures, :amount_precision, :integer
  end
end
