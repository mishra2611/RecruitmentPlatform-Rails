Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    post 'sign-up' => :create
  end
  resources :users
  get 'system_admin'=> 'system_admin#index'
  get 'job_seeker_home' => 'job_seeker#home'
  get 'job_seeker_edit' => 'job_seeker#edit'
  get 'job_seeker_jobs_list' => 'job_seeker#jobs_list'
  post 'job_seeker_jobs_filtered_list' => 'job_seeker#jobs_filtered_list'
  resources :job_applications
  resources :jobs
  resources :companies
  #get 'system_admin/index'
  #get 'sessions/new'
  get 'companies/show'
  get 'sessions/create'
  get 'recruiter/edit'
  get 'sessions/destroy'
  get 'recruiter/view'
  get 'recruiter/edit'
  get 'recruiter/view_jobs'
  get 'recruiter/edit_job'
  get 'view_applicants/view'
  get 'recruiter_edit_job' => 'recruiter#edit_job'
  get 'auth/:provider/callback', to: 'sessions#createLogin'
  get 'auth/failure', to: redirect('/login')
  get 'signout', to: 'sessions#destroy', as: 'signout'


  #get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'recruiter'=> 'recruiter#new'
  get 'companies'=> 'companies#index'
  get 'recruiter/edit_job'=> 'recruiter#edit_job'

  resources :resumes, only: [:index, :new,:create,:destroy]
root 'sessions#new'
end


