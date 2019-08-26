class UsersController < ApplicationController

  # GET: /users

  #render form
  get '/login' do
    erb :login
  end

  #create a session
  post '/login' do
    #recieve the input from login form
    #find user
    #authenticate user
    #log them in- creating a session
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      #success message
      redirect "users/#{@user.id}"
    else
      #show error comment
      flash[:errors] = "Wrong credentials!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  # PATCH: /users/5
  patch "/users/:id" do
    #we are getting id from url ^
    @user = User.find_by(id: params[:id])
    erb :show
  end

  #what routes do we need for signup?
  get '/signup' do
    #render my sign form
    #that form would point to a post '/users' method
    erb :signup
  end

  post '/users' do
    #only create user is they provide username, email, and password
    #add key/value pair
    #redirect to user profile
    #@user = User.find_by(:username => params[:username])

    if params[:name] != "" && params[:email] !="" && params[:password] !=""
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect_if_not_logged_in
    end
    #if @user != nil && @user.password == params[:password]
      #session[:user_id] = @user.id
      #redirect to '/users/:id'
    #else
      #redirect_if_not_logged_in?
    #end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end
end
