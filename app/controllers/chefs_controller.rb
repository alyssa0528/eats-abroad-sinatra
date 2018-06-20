class ChefsController < ApplicationController

  #render signup form
  get '/signup' do
    erb ':/users/signup'
  end
end
