class User < ApplicationRecord
  #enum usertype: [ :jobseeker, :recruiter, :both]
  include ActiveModel::Dirty
  has_secure_password
  has_many :jobs
  has_many :job_applications
  belongs_to :company, optional: true

  def self.from_omniauth(auth)
    where(email:auth.info.email, name: auth.info.name).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email=auth.info.email
      user.password=auth.uid
      if User.find_by_email(auth.info.email).nil? then
        user.phone="0000000000"
      end
      user.save!
    end
  end

  validates :email, uniqueness:{ scope: :usertype , message: " : This email id has already been taken" },format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :name, presence:true
  validates :phone, numericality: {only_integer: true},length: {is:10 , message: " : Number should be 10 digits long"}

end
