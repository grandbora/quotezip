QuoteApp::Application.routes.draw do
  root to: "feed#index"
  get "/uncached", to: "feed#uncached"
  resources :votes
  resources :reports
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
