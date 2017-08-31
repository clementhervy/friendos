class FixAssociationTables < ActiveRecord::Migration[5.1]
  def change
    rename_column :groups_users, :users_id, :user_id
    rename_column :groups_users, :groups_id, :group_id
    rename_column :categories_expenditures, :categories_id, :category_id
    rename_column :categories_expenditures, :expenditures_id, :expenditure_id
  end
end
