class CreateExpenditures < ActiveRecord::Migration[5.1]
  def change
    create_table :expenditures do |t|
      t.string :object
      t.datetime :date_made
      t.references :payer, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :amount
      t.boolean :is_paid

      t.timestamps
    end
  end
end
