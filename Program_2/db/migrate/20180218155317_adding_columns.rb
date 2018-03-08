class AddingColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users , :companyid ,:integer
    add_column :users, :phone,:string
  end
end
