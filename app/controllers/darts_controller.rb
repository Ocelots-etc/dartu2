class DartsController < ApplicationController

  # GET: /darts
  get "/darts" do
    erb :"/darts/index.html"
  end

  # GET: /darts/new
  get "/darts/new" do
    erb :"/darts/new.html"
  end

  # POST: /darts
  post "/darts" do
    redirect "/darts"
  end

  # GET: /darts/5
  get "/darts/:id" do
    erb :"/darts/show.html"
  end

  # GET: /darts/5/edit
  get "/darts/:id/edit" do
    erb :"/darts/edit.html"
  end

  # PATCH: /darts/5
  patch "/darts/:id" do
    redirect "/darts/:id"
  end

  # DELETE: /darts/5/delete
  delete "/darts/:id/delete" do
    redirect "/darts"
  end
end

#some functionality to add a dart to a set
#but before actually doing that, ask if there are 3 darts in that set already
#if so, say in a flash message "set is full!"
#otherwise, assign the dart to that set i.e. set the set_id of the dart equal to the set.id