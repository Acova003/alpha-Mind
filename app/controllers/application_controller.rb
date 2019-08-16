require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "shhhh"
    enable :sessions
  end

  get "/" do
    erb :welcome
  end



  helpers do
    def current_user
      #minimalization
      @current_user =|| User.find_by(:id => session[:user_id])
    end

    #returns a boolean
    def logged_in?
      #current_user will return nil or the entire user object( we want true or false)
      !!current_user
    end
  end

end
