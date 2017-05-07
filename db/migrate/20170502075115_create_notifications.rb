class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :type_notification
      t.integer :post_id
      t.boolean :read
      t.integer :x_user_id

      t.timestamps
    end
  end
end
