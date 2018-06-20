class ChefsController < ApplicationController

  #render signup form
  get '/signup' do
    erb ':/chefs/signup'
  end
end
