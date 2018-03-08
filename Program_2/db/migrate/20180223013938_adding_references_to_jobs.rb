class AddingReferencesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :user, index:true
    add_reference :jobs, :company, index:true
  end
end
