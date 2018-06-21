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

  #helpers!
  helpers do
    def current_user
      if session[:user_id] #if a session with a user_id exists (not nil)
        @current_user = Chef.find_by(:id => session[:user_id])
      end
    end

    def logged_in?
      !!current_user
    end
  end

end
