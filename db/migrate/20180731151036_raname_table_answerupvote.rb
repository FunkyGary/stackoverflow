class RanameTableAnswerupvote < ActiveRecord::Migration[5.2]
  def change
    rename_table :AnswerUpvotes, :anupvotes
  end
end
