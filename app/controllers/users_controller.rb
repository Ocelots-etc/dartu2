class UsersController < ApplicationController
  
  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/new
  get "/users/new" do
    if logged_in?
      redirect '/dart_sets' 
    else 
      erb :'/users/new' #we'll allow them to see the signup form
    end
    # erb :"/users/new"
  end

  # POST: /users
  post "/users" do
    if params[:username] == "" || params[:password] == ""
      redirect to '/users/new'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/dart_sets'
    end
    # redirect "/users"
  end

  get '/users/login' do
  #   @error_message = session[:error]
  #   session.delete :error
    if session[:user_id]
      redirect "/users/#{current_user.id}"
    else
      erb :"users/login"  
    end
  end

  post '/users/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{current_user.id}"
    else
      @error_message = "Invalid Login. Please Try Again"
      erb :'users/login'
    end
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    @dart_sets = @user.dart_sets 
    @darts = @user.darts
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find(params[:id])
    if current_user == @user
      erb :"/users/edit"
    else
      redirect "/users"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find(params[:id])
    if current_user == @user
      @user.update(params.except(:id, :_method))
      redirect "/user/:id"
    else
      redirect '/users'
    end
    # redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    @user = current_user.find(params[:id])
    @user.delete
    redirect "/users"
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end
end
