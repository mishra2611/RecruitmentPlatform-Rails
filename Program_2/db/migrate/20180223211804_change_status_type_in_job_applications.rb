class ChangeStatusTypeInJobApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :job_applications, :status, :integer
  end
end
