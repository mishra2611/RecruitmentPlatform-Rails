class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.string :linkedin
      t.string :portfolio
      t.text :additionalinfo
      t.string :gender
      t.string :race
      t.string :veteran
      t.string :disability

      t.timestamps
    end
  end
end
