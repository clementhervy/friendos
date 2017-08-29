class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :expenditure, foreign_key: true
      t.datetime :date_made
      t.references :payer, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
