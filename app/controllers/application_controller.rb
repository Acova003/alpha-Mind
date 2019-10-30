require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "shhhh"
    enable :sessions
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end



  helpers do
    def current_user
      #minimalization
      @current_user ||= User.find_by(:id => session[:user_id])
    end

    #returns a boolean
    def logged_in?
      #current_user will return nil or the entire user object( we want true or false)
      !!current_user
    end

    def redirect_if_not_logged_in?
      if !logged_in?
        redirect '/login'
      end
    end

    def authorized_user?(post)
      post.user == current_user
    end
  end

end
