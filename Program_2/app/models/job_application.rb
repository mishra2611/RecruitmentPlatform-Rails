class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job
  mount_uploader :resume, AttachmentUploader
  enum status: [:received, :in_process, :hired, :not_selected]
  validates :linkedin, presence: true, format: {with: /\A((https?:\/\/)?(www.)?linkedin\.com\/in\/.*\/?)?\z/, message: "only allows linkedin profile URLS."}
  validates :portfolio, presence: true, format: {with: /\A(#{URI::regexp}|((\w+\.)?\w+\.\w+(\/.*)*))?\z/, message: "only allows URLS."}
  validates :gender, presence:true
  validates :disability, presence:true
  validates :race, presence:true
  validates :veteran, presence:true
end
