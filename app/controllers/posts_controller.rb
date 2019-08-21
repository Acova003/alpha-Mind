class PostsController < ApplicationController

  # GET: /posts

  #Full CRUD
  #READ
  get '/posts' do
    #needs to save posts into a variable to reference in views
    @posts = Post.all
    erb :'posts/index'
  end
  #Index route for all posts #show out for single post

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb ':/posts/show'
  end
  #CREATE
  #get 'post/new' render a form to create a new post
  #post route to create a new post

  #UPDATE
  #get 'post/edit' to render the form for editing posts
  #patch route to update a post

  #DELETE
  #delete route to an existing post
  get "/posts" do
    @posts = current_user.posts
    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
    erb :"/posts/new.html"
  end

  # POST: /posts
  post "/posts" do
    redirect "/posts"
  end

  # GET: /posts/5
  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    redirect "/posts/:id"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    redirect "/posts"
  end
end
