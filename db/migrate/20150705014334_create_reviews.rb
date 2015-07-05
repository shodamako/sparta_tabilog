class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :point, null: false
      t.text :body,   null: false
      t.references :destination, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :reviews, [:destination_id, :user_id], unique: true
  end
end
