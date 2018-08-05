class RenameTableAnswerUpvote < ActiveRecord::Migration[5.2]
  def change
    rename_table :Answer_upvotes, :AnswerUpvotes
  end
end
