require 'sinatra/base'
require 'rack-flash'

class RestaurantsController < ApplicationController
  use Rack::Flash

  #shows list of all recommended restaurants
  get '/restaurants' do
    if logged_in?
      erb :'/restaurants/index'
    else
      redirect '/login'
    end
  end

  #renders form to submit a new restaurant and comment
  get '/restaurants/new' do
    if logged_in?
      erb :'/restaurants/new'
    else
      redirect '/login'
    end
  end

  #adds new restaurant and comment
  post '/restaurants' do
    if logged_in?
      #binding.pry
      if params[:restaurant].empty? && params[:comments].empty? && params[:restaurant_id].empty? #if nothing is selected
        flash[:message] = "**Please select a restaurant from the list below or add a new one.**"
        redirect '/restaurants/new'
      elsif params[:comments][:content].empty? # if no comment is entered
        flash[:message] = "**You must enter a comment.**"
        redirect '/restaurants/new'
      elsif params[:restaurant][:name].empty? #if an existing is chosen
        @restaurant = Restaurant.find_by(:id => params[:restaurant_id])
        #@restaurant.comments.build(:content => params[:comments][:content], :chef_id => current_user.id)
        @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
        flash[:message] = "**Restaurant successfully added to your list.**"
        redirect "/restaurants/#{@restaurant.id}"
      elsif params[:restaurant][:cuisine].empty? || params[:restaurant][:city_id].empty?
        flash[:message] = "**You must enter all fields.**"
        redirect '/restaurants/new'
      else #for brand new restaurant
        @restaurant = Restaurant.new(params[:restaurant])
        @restaurant.save
        @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
        flash[:message] = "**Restaurant successfully added to your list.**"
        redirect "/restaurants/#{@restaurant.id}"
      end
    else
      redirect '/login'
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
