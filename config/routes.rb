MiningStats::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  namespace "api/v1", :as=>:api_v1 do
    resources :gpu_stats
  end

  root :to => "gpu_stats#index"
end
