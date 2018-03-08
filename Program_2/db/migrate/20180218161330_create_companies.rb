class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :hq
      t.string :size
      t.integer :founded
      t.string :industry
      t.integer :revenue
      t.text :synopsis

      t.timestamps
    end
  end
end
