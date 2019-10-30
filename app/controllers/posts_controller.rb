class PostsController < ApplicationController

  # GET: /posts

  #Full CRUD
  #READ
  get '/posts' do
    #needs to save posts into a variable to reference in views
    @posts = Post.all
    erb :'/posts/index'
  end
  #CREATE
  #get 'post/new' render a form to create a new post
  #post route to create a new post
  get '/posts/new' do
    erb :'/posts/new'
  end

  #UPDATE
  #get 'post/edit' to render the form for editing posts
  #patch route to update a post
  post "/posts" do
    @post = Post.new(content: params[:content], rating: params[:rating], user_id: params[:user_id])
    if @post.save
        flash[:message] = "Post successfully created."
        redirect "/posts/#{@post.id}"
    else
      flash[:errors] = "Please enter all fields"
      redirect "/posts/new"
    end
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'/posts/show'
  end

  #DELETE
  #delete route to an existing post
  get "/posts" do
    @posts = current_user.posts
    redirect "/posts/#{@post.id}"
  end

  # GET: /posts/new
  get "/posts/new" do
    erb :"/posts/new.html"
  end

  # GET: /posts/5/edit
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    if authorized_user(@post)
      erb :'/posts/edit'
    else
      flash[:message] = "You're not authorized to edit this post"
      redirect "/posts/#{@post.id}"
    end
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    @post = Post.find(params[:id])
    @post.update(content: params[:content], rating: params[:rating])
    redirect "/posts/#{@post.id}"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id" do
    @post = Post.find(params[:id])
    @post.destroy
    redirect "/posts"
  end
end
