class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hours, :integer
    add_column :users, :phone, :integer
  end
end
