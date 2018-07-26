class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.text :content
      t.integer :upvotes_count 
      t.timestamps
    end
  end
end
