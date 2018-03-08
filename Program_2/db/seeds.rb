# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.create(id: 1, name: 'Amazon', website: 'www.amazon.com', hq: 'Seattle', size: '1000+', founded: 1994, industry: 'Computer Science', revenue: '1000000', synopsis: 'Sample synopsis')
Company.create(id: 2, name: 'Facebook', website: 'www.facebook.com', hq: 'Menlo Park', size: '1000+', founded: 2004, industry: 'Computer Science', revenue: '1000000', synopsis: 'Sample synopsis')

User.create(id: 0, name: 'Admin', email: 'admin517@gmail.com', password:'admin@517', phone: '9123456780',usertype: 0,company_id: 1)
User.create(id: 1, name: 'Recruiter 1', email: 'recruiter517@gmail.com', password:'recruiter@517', phone: '9123456780',usertype: 2,company_id: 1)
User.create(id: 2, name: 'Applicant 1', email: 'applicant517@gmail.com', password:'applicant@517', phone: '9123456780',usertype: 1,company_id: 2)


Job.create(id:1, description: 'Software Development Engineer', employment: 'Full-time', responsibilities: 'Coding', requirements: 'GPA 3.0', user_id: 1, company_id: 1)
