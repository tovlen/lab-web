class AddUserId < ActiveRecord::Migration[6.1]
    def change
      add_column :labworks, :user_id, :integer
      add_foreign_key :labworks, :users
    end
  end