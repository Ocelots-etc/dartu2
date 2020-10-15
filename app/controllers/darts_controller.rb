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
