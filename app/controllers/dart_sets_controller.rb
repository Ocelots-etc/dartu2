class DartSetsController < ApplicationController
  before "/dart_sets*" do
    redirect_if_not_logged_in
  end

  # GET: /dart_sets
  get "/dart_sets" do
    @dart_sets = current_user.dart_sets.all
    erb :"/dart_sets/index"
  end

  # GET: /dart_sets/new
  get "/dart_sets/new" do
    @dart_sets = current_user.dart_sets.new
    erb :'/dart_sets/new'
  end

  # POST: /dart_sets
  post "/dart_sets" do
    @dart_sets = current_user.dart_sets.new(params)
    if @dart_sets.save
      redirect "/dart_sets"
    else
      erb :'dart_sets/new'
    end
  end

  # GET: /dart_sets/5
  get "/dart_sets/:id" do
    @dart_set = current_user.dart_sets.find(params[:id])
    @dart_sets = current_user.dart_sets.all
    @darts = current_user.darts.where("dart_set_id is ?", params[:id])
    @dart = current_user.darts.find(params[:id])
    erb :"/dart_sets/show"
  end

  # GET: /dart_sets/5/edit
  get "/dart_sets/:id/edit" do
    if current_user.dart_sets.find(params[:id])
      @dart_set = current_user.dart_sets.find(params[:id])
      erb :"/dart_sets/edit"
    else
      @error = "That's not your dart set! No touchy!"
      redirect "/dart_sets/#{@dart_set.id}/edit"
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
