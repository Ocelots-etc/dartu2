class DartCasesControllers.rbsController < ApplicationController

  # GET: /dart_cases.rbs
  get "/dart_cases.rbs" do
    erb :"/dart_cases.rbs/index.html"
  end

  # GET: /dart_cases.rbs/new
  get "/dart_cases.rbs/new" do
    erb :"/dart_cases.rbs/new.html"
  end

  # POST: /dart_cases.rbs
  post "/dart_cases.rbs" do
    redirect "/dart_cases.rbs"
  end

  # GET: /dart_cases.rbs/5
  get "/dart_cases.rbs/:id" do
    erb :"/dart_cases.rbs/show.html"
  end

  # GET: /dart_cases.rbs/5/edit
  get "/dart_cases.rbs/:id/edit" do
    erb :"/dart_cases.rbs/edit.html"
  end

  # PATCH: /dart_cases.rbs/5
  patch "/dart_cases.rbs/:id" do
    redirect "/dart_cases.rbs/:id"
  end

  # DELETE: /dart_cases.rbs/5/delete
  delete "/dart_cases.rbs/:id/delete" do
    redirect "/dart_cases.rbs"
  end
end
