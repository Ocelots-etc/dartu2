class DartSetsController < ApplicationController

  # GET: /dart_sets
  get "/dart_sets" do
    erb :"/dart_sets/index.html"
  end

  # GET: /dart_sets/new
  get "/dart_sets/new" do
    erb :"/dart_sets/new.html"
  end

  # POST: /dart_sets
  post "/dart_sets" do
    redirect "/dart_sets"
  end

  # GET: /dart_sets/5
  get "/dart_sets/:id" do
    erb :"/dart_sets/show.html"
  end

  # GET: /dart_sets/5/edit
  get "/dart_sets/:id/edit" do
    erb :"/dart_sets/edit.html"
  end

  # PATCH: /dart_sets/5
  patch "/dart_sets/:id" do
    redirect "/dart_sets/:id"
  end

  # DELETE: /dart_sets/5/delete
  delete "/dart_sets/:id/delete" do
    redirect "/dart_sets"
  end
end
