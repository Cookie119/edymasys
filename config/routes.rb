Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4

  resources :addstudents
  resources :galleries
  resources :events
  resources :notices
  resources :divisions
  resources :subjects
  resources :teachers
  resources :master_timetables
  get 'maker/index'
  devise_for :admins, controller:{
    sessions: 'admins/sessions'
  }



  get '/webmanifest/manifest.json', to: 'application#manifest'

# subscriptions
  post '/subscribe', to: 'pages#sub_create'

  get '/index', to: 'pages#index', as: 'pages_index'
  get '/about_us', to: 'pages#about_us', as: 'pages_about_us'
  get '/about', to: 'pages#about', as: 'pages_about'
  get '/contact', to: 'pages#contact', as: 'pages_contact'
  get 'master_timetables/render_master_timetable_pdf', to: 'master_timetables#render_master_timetable_pdf', as: 'render_master_timetable_pdf'
  get 'addstudents/download_pdf', to: 'addstudents#download_pdf', as: 'download_pdf_students'

    get '/pages/userEvents', to: 'pages#userEvents', as: 'pages_userEvents'
  get '/map', to: 'pages#map', as: 'pages_map'
  get '/time_table_list', to: 'pages#time_table_list', as: 'pages_time_table_list'
  get '/weekly_timetable', to: 'pages#weekly_timetable', as: 'weekly_timetable'
  


  get 'notices/filter_by_category', to: 'pages#notices_summary', as: 'filter_notices_by_category'

  get '/notices_summary', to: 'pages#notices_summary', as: 'notices_summary'
  get '/notices_details/:id', to: 'pages#notices_details', as: 'notices_details'
  

  get '/events_summary', to: 'pages#events_summary', as: 'events_summary'
  get '/events_details/:id', to: 'pages#events_details', as: 'events_details'
  
  get '/galleries_summary', to: 'pages#gallery_summary', as: 'galleries_summary'
  get '/galleries_details/:id', to: 'pages#gallery_details', as: 'galleries_details'

  get '/teachers_summary', to: 'pages#teachers_summary', as: 'teachers_summary'
  get '/teachers_details/:id', to: 'pages#teachers_details', as: 'teachers_details'
  
  # Route for selecting the division
  get '/select_division', to: 'maker#select_division', as: 'select_division'
  
  # Route for displaying the timetable based on the selected division
  get '/display_timetable', to: 'maker#display_timetable', as: 'display_timetable'
  get '/whyOurSch', to: 'pages#whyOurSch', as: 'whyOurSch'

  get '/our_trust', to: 'pages#our_Trusties', as: 'our_Trust'

  # Route for updating the master timetable
  post 'update_master_timetable', to: 'maker#update_master_timetable', as: 'update_master_timetable'

  post '/week_timetable/:division_id', to: 'maker#week_timetable', as: 'week_timetable'

  resources :master_timetables do
    post 'upload', on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root "pages#index"
<<<<<<< HEAD
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
end
