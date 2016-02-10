class CreateMyComments < ActiveRecord::Migration
  def change
    create_table :my_comments do |t|
      t.integer :user_id
      t.string :my_thread_id
      t.string :overview

      t.timestamps null: false
    end
  end
end
