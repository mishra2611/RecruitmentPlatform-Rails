class Editusers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usertype,:string
    remove_column :users,:companyid,:integer
  end
end
