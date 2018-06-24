class ChefsController < ApplicationController

  #render signup form
  get '/signup' do
    if !logged_in?
      erb :'/chefs/signup'
    else
      redirect '/restaurants' #error message: you are already logged in
    end
  end

  #render login page, but only if chef is not already logged in
  get '/login' do
    if !logged_in?
      erb :'/chefs/login'
    else
      redirect '/restaurants'
    end
  end

  #creates new Chef (user)
  post '/signup' do
    #binding.pry
    @chef = Chef.new(params[:chef])
    if @chef.save #this would mean all the validations are true
      session[:user_id] = @chef.id
      redirect "/restaurants" #go to page that lists all recommended restaurants
    else
      redirect '/signup' #redirect to signup page; possibly install Flash error here?
    end
  end

  #when user logs in, a params hash with chef[email] and chef[password] attributes will be created
  post '/login' do
    chef = Chef.find_by(:email => params[:chef][:email]) #if submitted email isn't found, nil will be returned
    #need to also confirm password (authenticate)
    if chef && chef.authenticate(params[:chef][:password]) #if chef is not nil, and submitted password is authenticated
      session[:user_id] = chef.id #will log chef in successfully
      redirect '/restaurants'
    else
      redirect '/login' #have error message appear, ask user to log in b/c previous submission was bad
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
