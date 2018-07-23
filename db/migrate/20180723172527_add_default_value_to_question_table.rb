class AddDefaultValueToQuestionTable < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :favorites_count, :integer, default: 0
    change_column :questions, :upvotes_count, :integer, default: 0
    change_column :questions, :replies_count, :integer, default: 0
  end
end
