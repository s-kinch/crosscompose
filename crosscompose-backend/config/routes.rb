Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/puzzles/create/suggest/:pattern', to: 'puzzles#word_suggestions'
      post '/puzzles/create/:slug', to: 'puzzles#save'
      get '/puzzles/create', to: 'puzzles#create'
      post '/puzzles/play/:slug/check', to: 'puzzles#check_letter'
      get '/puzzles/play/:slug', to: 'puzzles#play'
      get '/puzzles/play', to: 'puzzles#index'
    end
  end


end
