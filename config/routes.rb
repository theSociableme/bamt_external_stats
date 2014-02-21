MiningStats::Application.routes.draw do
  namespace "api/v1", :as=>:api_v1 do
    resources :gpu_stats
  end
end
