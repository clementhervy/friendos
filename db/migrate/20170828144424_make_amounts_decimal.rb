class MakeAmountsDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :expenditures, :amount, :decimal, :precision => 8, :scale => 2
    change_column :payments, :amount, :decimal, :precision => 8, :scale => 2
  end
end
