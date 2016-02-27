Rails.application.routes.draw do
  root 'student#index'
	
	get '/submission', to: 'student#create'	
	
  get '/post-grade', to: 'student#grade'

  get '/manage', to: 'manage#index', as: :manage

  get '/error', to: 'lti#error', as: :lti_error
  
  post '/hit', to: 'lti#verify'
  
  post '/launch', to: 'lti#verify'
  
end
