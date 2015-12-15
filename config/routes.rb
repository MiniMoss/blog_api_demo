Rails.application.routes.draw do
  root 'welcomes#index'

  # User's routes
  devise_for :users, :path_prefix => 'admin/my', :skip => [:registrations]
  #routes for current_user to change password for him/herself
  as :user do
    get 'admin/my/users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    patch 'admin/my/users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  scope '/admin' do
    resources :users do
      get 'renew_token', on: :member
    end
  end
end
