class RestaurantsController < ApplicationController
  get '/restaurants' do
    #show list of recommended restaurants
    erb :'/restaurants/index'
  end
end
