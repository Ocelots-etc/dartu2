#@dart_set.user = current_user
class DartSetsController < ApplicationController

  # GET: /dart_sets
  get "/dart_sets" do
    if logged_in? #&& current_user
      @dart_sets = current_user.dart_sets
      erb :"/dart_sets/index"
    else
      redirect "/"
    end
  end

  # GET: /dart_sets/new
  get "/dart_sets/new" do
    erb :'/dart_sets/new'
  end

  # POST: /dart_sets
  post "/dart_sets" do
    # @dart_set = DartSet.new(name: params[:name], user: current_user)
    @dart_set = current_user.dart_sets.create(params)
    if @dart_set.save
      redirect "/dart_sets"
    else
      @error_message = "Oops, you made an error"
      erb :"darts/show"
    end
  end

  # GET: /dart_sets/5
  get "/dart_sets/:id" do
    set_dart_set
    if logged_in? && @dart_set.user == current_user
      erb :"/dart_sets/show"
    else
        redirect "/"
    end
  end

  # GET: /dart_sets/5/edit
  get "/dart_sets/:id/edit" do
    set_dart_set
    if logged_in? && @dart_set.user == current_user
      erb :"/dart_sets/edit"
    else
      redirect "/"
    end
  end

  # PATCH: /dart_sets/5
  patch "/dart_sets/:id" do
    set_dart_set
    if @dart_set.user == current_user 
      @dart_set.update(params.except(:id, :_method))
      redirect "/dart_sets/#{@dart_set.id}"
    else
      erb :'dart_sets/edit'
    end
  end

  # DELETE: /dart_sets/5/delete
  delete "/dart_sets/:id/delete" do
    set_dart_set
    if logged_in? && @dart_set.user == current_user
      @dart_set.destroy
      redirect "/dart_sets"
    else
      redirect "/"
    end
  end

  private 
  def set_dart_set
    @dart_set = DartSet.find_by(id: params[:id])
  end
end
