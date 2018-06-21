class RestaurantsController < ApplicationController
  get '/restaurants' do
    #show list of recommended restaurants
    if logged_in?
      erb :'/restaurants/index'
    else
      redirect '/login'
    end
  end

  #renders form to submit a new restaurant and comments
  get '/restaurants/new' do
    if logged_in?
      erb :'/restaurants/new'
    else
      redirect '/login'
    end
  end

  post '/restaurants' do
  end

  #show individual restaurant page
  get '/restaurants/:id' do
    @restaurant = Restaurant.find_by(id: params[:id])
    if logged_in?
      erb :"/restaurants/show"
    else
      redirect '/login'
    end
  end
end
