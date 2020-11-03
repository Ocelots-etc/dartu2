#@dart_set.user = current_user
class DartSetsController < ApplicationController
  # before "/dart_sets*" do
  #   redirect_if_not_logged_in
  # end

  # GET: /dart_sets
  get "/dart_sets" do
    @dart_sets = current_user.dart_sets
    erb :"/dart_sets/index"
  end

  # GET: /dart_sets/new
  get "/dart_sets/new" do
    erb :'/dart_sets/new'
  end

  # POST: /dart_sets
  post "/dart_sets" do
    @dart_set = DartSet.new(name: params[:name], user: current_user)
    if @dart_set.save
      redirect "/dart_sets"
    else
      @error_message = "Oops, you made an error"
      erb :"darts/show"
    end
  end

  # GET: /dart_sets/5
  get "/dart_sets/:id" do
    if logged_in? && current_user.dart_sets.include?(DartSet.find(params[:id]))
      @dart_set = DartSet.find(params[:id])
    else
        redirect "/dart_sets"
    end
    erb :"/dart_sets/show"
  end

  # GET: /dart_sets/5/edit
  get "/dart_sets/:id/edit" do
    @user = User.find(params[:id])
    if logged_in? && current_user
    # if current_user.dart_sets.find(params[:id])
      @dart_set = DartSet.find(params[:id])
      erb :"/dart_sets/edit"
    end
  end

  # PATCH: /dart_sets/5
  patch "/dart_sets/:id" do
    @dart_set = current_user.dart_sets.find(params[:id])
    if @dart_set.update(params.except(:id, :_method))
      redirect "/dart_sets/#{@dart_set.id}"
    else
      erb :'dart_sets/edit'
    end
  end

  # DELETE: /dart_sets/5/delete
  delete "/dart_sets/:id/delete" do
    @dart_set = current_user.dart_sets.find(params[:id])
    @dart_set.delete
    redirect "/dart_sets"
  end
end
