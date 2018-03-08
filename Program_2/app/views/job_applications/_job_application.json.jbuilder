json.extract! job_application, :id, :linkedin, :portfolio, :additionalinfo, :gender, :race, :veteran, :disability, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
