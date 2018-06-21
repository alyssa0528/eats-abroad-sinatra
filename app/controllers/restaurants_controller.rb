class RestaurantsController < ApplicationController
  get '/restaurants' do
    #show list of recommended restaurants
    erb :'/restaurants/index'
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find_by(id: params[:id])
    erb :"/restaurants/show"
  end
end
