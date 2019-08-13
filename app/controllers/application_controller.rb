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

  get 'login' do
  end

  post 'login' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
  end

  get 'logout' do
    session.destroy
    redirect '/'
  end

  helpers do
    def current_user
      User.find_by(:id => session[:user_id])
    end
  end

end
