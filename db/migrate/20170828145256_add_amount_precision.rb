class AddAmountPrecision < ActiveRecord::Migration[5.1]
  def change
    change_column :expenditures, :amount, :integer
    change_column :payments, :amount, :integer
    add_column :expenditures, :amount_precision, :integer
  end
end
