class RanameTableAnswerupvote < ActiveRecord::Migration[5.2]
  def change
    rename_table :Answer_upvotes, :anupvotes
  end
end
