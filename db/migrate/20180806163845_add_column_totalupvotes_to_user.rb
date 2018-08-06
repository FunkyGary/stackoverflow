class AddColumnTotalupvotesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :totalupvotes, :integer
  end
end
