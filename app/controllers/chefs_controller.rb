require 'sinatra/base'
require 'rack-flash'

class ChefsController < ApplicationController
use Rack::Flash

  #render signup form
  get '/signup' do
    if !logged_in?
      erb :'/chefs/signup'
    else
      flash[:message] = "**You are already logged in.**"
      redirect '/restaurants'
    end
  end

  #render login page, but only if chef is not already logged in
  get '/login' do
    if !logged_in?
      erb :'/chefs/login'
    else
      flash[:message] = "**You are already logged in.**"
      redirect '/restaurants'
    end
  end

  #creates new Chef (user)
  post '/signup' do
    @chef = Chef.new(params[:chef])
    if @chef.save #this would mean all the validations are true
      session[:user_id] = @chef.id
      redirect "/restaurants"
    elsif
      Chef.all.find do |chef|
        chef.email == @chef.email
      end
      flash[:message] = "**Email address already registered with Eats Abroad. Please sign in, or create an account with a different email address."
      redirect '/signup'
    elsif !@chef.save
      flash[:message] = "**Please confirm all fields are completed before submitting.**"
      redirect '/signup'
    end
  end

  post '/login' do
    chef = Chef.find_by(:email => params[:chef][:email])
    if chef && chef.authenticate(params[:chef][:password]) 
      session[:user_id] = chef.id
      redirect '/restaurants'
    else
      flash[:message] = "**Log-in credentials incorrect. Please try again.**"
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  #show list of all chefs in database
  get '/chefs' do
    if logged_in?
      erb :'/chefs/index'
    else
      redirect '/login'
    end
  end

  #show individual chef's favorite restaurants
  get '/chefs/:id' do
    if logged_in?
      @chef = Chef.find(params[:id])
      erb :'/chefs/show'
    else
      redirect '/login'
    end
  end

end
