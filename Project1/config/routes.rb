Rails.application.routes.draw do
  get 'session/index'
  get 'session/create'
  get 'session/show'
  get 'session/update'
  get 'session/destroy'
  get 'reimbursement/index'
  get 'reimbursement/create'
  get 'reimbursement/show'
  get 'reimbursement/update'
  get 'reimbursement/destroy'
  get 'personnel/index'
  get 'personnel/create'
  get 'personnel/show'
  get 'personnel/update'
  get 'personnel/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
