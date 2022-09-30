Rails.application.routes.draw do

  
  ## ROOT ##
  root to: 'courses#index' 

  #################### USERS ####################

  ## DEVISE ##
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  
  ## READ ##
  get 'users/:id', to: 'users#show', as: 'users_show'
  get 'users', to: 'users#index', as: 'users_index'

  ## DELETE ##
  delete 'users/delete', to: 'users#delete', as: 'users_delete'
  delete 'users/delete_picture', to: 'users#delete_picture', as: 'users_delete_picture'

  #################### COURSES ####################

  ## CREATE ##
  get 'courses/new'
  post 'courses', to: 'courses#create', as: 'courses_create'

  ## READ ##
  get 'courses/index'
  get 'courses/show'

  ## UPDATE ##
  get 'courses/edit'
  patch 'courses/update', to: 'courses#update', as: 'courses_update'

  ## DELETE ##
  delete 'courses/delete', to: 'courses#delete', as: 'courses_delete'


  #################### COMMENTS ####################
  
  ## CREATE ##
  get 'reviews/new'
  post 'reviews', to: 'reviews#create', as: 'reviews_create'

  ## READ ##
  get 'reviews/index', to: 'reviews#index', as: 'reviews_index'
  get 'reviews/show', to: 'reviews#show', as: 'reviews_show'

  ## UPDATE ##
  get 'reviews/edit'
  patch 'reviews/update', to: 'reviews#update', as: 'reviews_update'

  ## DELETE ##
  delete 'reviews/delete', to: 'reviews#delete', as: 'reviews_delete'

  #################### MODULES ####################

  ## CREATE ##
  get 'course_modules/new'
  post 'course_modules', to: 'course_modules#create', as: 'course_modules_create'

  ## READ ##
  get 'course_modules/index'
  get 'course_modules/show'
  
  ## UPDATE ##
  get 'course_modules/edit'
  patch 'course_modules/update', to: 'course_modules#update', as: 'course_modules_update'
  
  ## DELETE ##
  delete 'course_modules/delete', to: 'course_modules#delete', as: 'course_modules_delete'

  #################### INSCRIPTIONS ####################
  
  ## READ ##
  get 'inscriptions/index'
  get 'inscriptions', to: 'inscriptions#create', as: 'inscriptions_create'

  ## DELETE ##
  delete 'inscriptions/delete', to: 'inscriptions#delete', as: 'inscriptions_delete'

  #################### COMMENTS ####################
  
  ## CREATE ##
  get 'comments/new'
  post 'comments', to: 'comments#create', as: 'comments_create'

  ## READ ##
  get 'comments/index', to: 'comments#index', as: 'comments_index'
  get 'comments/show', to: 'comments#show', as: 'comments_show'

  ## UPDATE ##
  get 'comments/edit'
  patch 'comments/update', to: 'comments#update', as: 'comments_update'

  ## DELETE ##
  delete 'comments/delete', to: 'comments#delete', as: 'comments_delete'

  #################### REPLIES ####################
  
  ## CREATE ##
  get 'replies/new'
  post 'replies', to: 'replies#create', as: 'replies_create'

  ## READ ##
  get 'replies/index', to: 'replies#index', as: 'replies_index'
  get 'replies/show', to: 'replies#show', as: 'replies_show'

  ## UPDATE ##
  get 'replies/edit'
  patch 'replies/update', to: 'replies#update', as: 'replies_update'

  ## DELETE ##
  delete 'replies/delete', to: 'replies#delete', as: 'replies_delete'


  resources :searches
end
