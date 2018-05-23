Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/puzzles/create/:slug', to: 'puzzles#save'
      get '/puzzles/create', to: 'puzzles#create'
      get '/puzzles/play/:slug', to: 'puzzles#play'
      get '/puzzles/play', to: 'puzzles#index'
    end
  end


end
