QuoteApp::Application.routes.draw do
  root to: "feed#index"
  get "/uncached", to: "feed#uncached"
  get ":id" => "feed#show", :constraints => { :id => /[0-9]*/ }

  resources :votes
  resources :reports
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
