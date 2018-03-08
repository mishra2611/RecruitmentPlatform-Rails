class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :employment
      t.text :responsibilities
      t.text :requirements

      t.timestamps
    end
  end
end
