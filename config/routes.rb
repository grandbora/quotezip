QuoteApp::Application.routes.draw do
  root to: "feed#index"
  resources :votes
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
