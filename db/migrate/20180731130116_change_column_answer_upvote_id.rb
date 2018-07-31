class ChangeColumnAnswerUpvoteId < ActiveRecord::Migration[5.2]
  def change
    rename_column :answer_upvotes, :question_id, :answer_id
  end
end
