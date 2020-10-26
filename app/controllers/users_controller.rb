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
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
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
    if logged_in? && current_user == @user
      @dart_sets = @user.dart_sets 
      @darts = @user.darts
      erb :"/users/show"
    else
      "Not your darts, no touchy!"

    end
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
      redirect '/users/login'
    else
      redirect '/'
    end
  end
end
