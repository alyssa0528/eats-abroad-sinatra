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
    #params will
    #binding.pry
    if params[:comments][:content].empty?
      redirect '/restaurants/new' #error message here?
    #  binding.pry
  elsif params[:restaurant][:name].empty? #if a user selects an existing restaurant from the list
      binding.pry
      @restaurant = Restaurant.find_by(:id => params[:restaurant][:id])
      #@restaurant.chefs << Chef.new(:name => current_user.name)
      @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
      redirect "/restaurants/#{@restaurant.id}"
    else
      @restaurant = Restaurant.new(params[:restaurant]) #if a brand new restaurant is added by user w/all inputs filled out
      @restaurant.save #saves to database and creates a @restaurant ID
      @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
      redirect "/restaurants/#{@restaurant.id}"
    end
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
