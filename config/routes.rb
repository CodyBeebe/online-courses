Rails.application.routes.draw do
  root "submissions#index"
  
  # Eliminates the need for GETs
  resources :submissions, only: [:index, :new, :create, :destroy]
  
  #root 'student#index'
	
	#get '/submission', to: 'student#create'	
	
  #get '/post-grade', to: 'student#grade'

  get '/manage', to: 'manage#index', as: :manage

  get '/error', to: 'lti#error', as: :lti_error
  
  post '/hit', to: 'lti#verify'
  
  post '/launch', to: 'lti#verify'
  
end
