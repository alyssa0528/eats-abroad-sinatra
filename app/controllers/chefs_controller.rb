class ChefsController < ApplicationController

  #render signup form
  get '/signup' do
    erb :'/chefs/signup'
  end

  post '/chefs' do
    #binding.pry
    @chef = Chef.new(params[:chef])
    if @chef.save #this would mean all the validations are true
      session[:user_id] = @chef.id
      redirect "/chefs/#{@chef.id}" #go to chef's page
    else
      redirect '/signup' #redirect to signup page; possibly install Flash error here?
    end

  get '/login' do
    erb :'/chefs/login'
  end
  end
end
