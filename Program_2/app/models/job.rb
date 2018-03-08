class Job < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :job_applications , :dependent => :destroy
end
