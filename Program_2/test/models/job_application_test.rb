require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "shouldn't allow empty job application" do
    job_application = JobApplication.new
    refute job_application.valid?
  end

  test "shouldn't allow job application with invalid linkedin URL" do
    job_application = JobApplication.new(linkedin: 'www.abc.com', portfolio: 'www.abc.com',
                                         additionalinfo: 'test', gender: 'Male', race: 'Asian',
                                         veteran: 'Not a veteran', disability: 'Not disabled',
                                         status: 0, user_id: 2, job_id: 1)
    refute job_application.valid?
  end

  test "shouldn't allow job application with invalid portfolio URL" do
    job_application = JobApplication.new(linkedin: 'www.linkedin.com/in/abc', portfolio: 'helloworld',
                                         additionalinfo: 'test', gender: 'Male', race: 'Asian',
                                         veteran: 'Not a veteran', disability: 'Not disabled',
                                         status: 0, user_id: 2, job_id: 1)
    refute job_application.valid?
  end

  test "shouldn't allow job application with invalid user id" do
    job_application = JobApplication.new(linkedin: 'www.linkedin.com/in/abc', portfolio: 'www.abc.com',
                                         additionalinfo: 'test', gender: 'Male', race: 'Asian',
                                         veteran: 'Not a veteran', disability: 'Not disabled',
                                         status: 0, user_id: -1, job_id: 1)
    refute job_application.valid?
  end

  test "shouldn't allow job application with invalid job id" do
    job_application = JobApplication.new(linkedin: 'www.linkedin.com/in/abc', portfolio: 'www.abc.com',
                                         additionalinfo: 'test', gender: 'Male', race: 'Asian',
                                         veteran: 'Not a veteran', disability: 'Not disabled',
                                         status: 0, user_id: 2, job_id: -1)
    refute job_application.valid?
  end

end
