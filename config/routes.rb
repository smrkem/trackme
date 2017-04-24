Rails.application.routes.draw do
  root to: "goals#index"

  resources :goals do
    post 'complete_now', on: :member
    resources :goal_activities, only: [:new, :create, :destroy]
  end
  resources :health_statuses


  resources :users, controller: :users, only: :create do
      resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
  end

  get "/confirm_email/:token" => "email_confirmations#update", as: "confirm_email"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
