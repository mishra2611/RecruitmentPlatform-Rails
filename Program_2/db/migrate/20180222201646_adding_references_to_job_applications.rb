class AddingReferencesToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_applications, :user, index:true
    add_reference :job_applications, :job, index:true
  end
end
