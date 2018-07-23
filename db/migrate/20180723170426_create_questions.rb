class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :favorites_count
      t.integer :upvotes_count
      t.integer :replies_count
      t.timestamps
    end
  end
end
