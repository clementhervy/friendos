class CreateAssociationTables < ActiveRecord::Migration[5.1]
  def change
    
    create_table :categories_expenditures, id: false do |t|
      t.belongs_to :categories, index: true
      t.belongs_to :expenditures, index: true
    end
  
    create_table :groups_users, id: false do |t|
      t.belongs_to :groups, index: true
      t.belongs_to :users, index: true
    end
  
  end
end
