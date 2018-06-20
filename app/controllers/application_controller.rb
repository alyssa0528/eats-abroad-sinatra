require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  #shows root (homepage; have links to sign up and log in)
  get "/" do
    erb :welcome
  end

end
