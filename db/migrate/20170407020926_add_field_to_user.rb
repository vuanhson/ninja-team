class AddFieldToUser < ActiveRecord::Migration[5.0]
   def change
    add_column :users, :user_name, :string
    add_column :users, :address, :string
    add_column :users, :birth_day, :timestamps
    add_column :users, :name, :string
    add_column :users, :phonenumber, :string
    add_column :users, :avatar, :string
  end
end
