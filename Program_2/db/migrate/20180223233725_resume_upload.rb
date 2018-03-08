class ResumeUpload < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :resume, :string
  end
end
