Rails.application.routes.draw do
  use_doorkeeper
  mount API => '/'
  mathjax 'mathjax'

  get 'home/index'
  get 'researches/index'
  get 'dashboard/index'

  devise_for :users, path_prefix: 'd', controllers: { registrations: 'registrations' }
  concern :commentable do
    resources :comments, except: [ :new, :show ]
    get '/comments/reply/:id' => 'comments#reply', as: :reply_comment
  end
  resources :users do
    resources :articles, concerns: :commentable
    get '/articles/:id/versions' => 'articles#versions', as: :article_versions
    get '/articles/:id/versions/:version_id' => 'articles#delete_version', as: :delete_version
    get 'mailbox/index'
    get 'mailbox/reply_message/:id' => 'mailbox#reply_message', as: :reply_message
    get 'mailbox/write_message' => 'mailbox#write_message', as: :write_message
    post 'mailbox/send_message' => 'mailbox#send_message', as: :send_message
    get 'mailbox/delete_message/:id' => 'mailbox#delete_message', as: :delete_message
    get 'mailbox/delete_notification/:id' => 'mailbox#delete_notification', as: :delete_notification
    get 'mailbox/empty_trash' => 'mailbox#empty_trash', as: :empty_trash
    get 'mailbox/restore_message/:id' => 'mailbox#restore_message', as: :restore_message
  end
  resources :groups
  resources :organizations
  resources :organizationships
  resources :references
  resources :journals

  root 'home#index'

  if File.exist? "#{Rails.root}/config/engine_routes.rb"
    instance_eval File.read "#{Rails.root}/config/engine_routes.rb"
  end
end
