class CreateAnswerUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :anupvotes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.timestamps
    end
  end
end
