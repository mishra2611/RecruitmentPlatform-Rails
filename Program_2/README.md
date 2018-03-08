# README
Ruby version 2.4.3

Admin Login details:-

    Email Id-admin517@gmail.com
    Password-admin@517
      
Admin can perform the following tasks:-	  
* Log into the Admin account using the above credentials.
* Switch user roles by clicking on Switch to Job Seeker or Switch to Recruiter.
* View his own profile information.
* Create new Job-seeker / Recruiter accounts using new email-id.
* View and delete all users, companies, jobs and job-applications.
* In order to create a new job / view job postings, switch to Recruiter role.
* To create a new job-application, switch to job-seeker role.


Test Recruiter Login details:-
      
      Email Id-recruiter517@gmail.com
      Password-recruiter@517  
            
* Recruiter can perform the following tasks:-
* Log In, view and edit profile.
* Create Companies.
* Create Job postings for his company.
* View Applicants.
* View all job postings but only modify jobs posted by him.
* Delete a Job posting.
* Change status of a job application.
      
Test Applicant (Job-seeker) Login details:-
      
      Email Id-applicant517@gmail.com
      Password-applicant@517        

Applicant can perform following tasks:- 
* Log-In, edit and view his/her profile
* Look at company information       
* Apply for multiple jobs and upload resume
* Withdraw job applications
* Search for jobs by applying filters
* Look at the status of his submitted job application.

**We have also implemented sign-up using Google Authentication where your Google email and password is used as credentials.
The default role during Google sign-up is recruiter but you can change roles after logging-in or edit profiles**

**When a recruiter deletes a job, an email is sent to the applicant saying that the job is closed**

**We have also implemented testing of job applicant model and controller**

App information



    1. Every user is by default both a job-seeker and a recruiter. They can choose a role during login, and can switch between        roles.
    
    2. Job-seekers can apply to a job only once. They need to withdraw their existing application if they want to apply again.
    
    3. Once sign-up is completed, you will need to log in again.
    
    4. During login, if the email id entered has not been registered, you will be redirected to the Sign Up page.
    
    5. If a user does not have a current company,select no company option. That is a blank company. 
    
    6. If a Job posting is deleted, all corresponding job applications also get deleted.
    
    7. If a company is deleted, all its job postings and applications are deleted. Also, the comapany id gets restored to null for all its recruiters.
    
    8. If a job-seeker account is created, all his job applications are immediately withdrawn.
    
    9. If a recruiter account is deleted, all his job postings are deleted.
    
    10. If a recruiter tries to change his company, he no longer has access to old job postings and his current company is changed.
    
   
