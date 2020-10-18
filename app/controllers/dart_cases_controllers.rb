class DartCasesControllers < ApplicationController

  # GET: /dart_cases
  get "/dart_cases" do
    erb :"/dart_cases/index.html"
  end

  # GET: /dart_cases/new
  get "/dart_cases/new" do
    erb :"/dart_cases/new.html"
  end

  # POST: /dart_cases
  post "/dart_cases" do
    redirect "/dart_cases"
  end

  # GET: /dart_cases/5
  get "/dart_cases/:id" do
    erb :"/dart_cases/show.html"
  end

  # GET: /dart_cases/5/edit
  get "/dart_cases/:id/edit" do
    erb :"/dart_cases/edit.html"
  end

  # PATCH: /dart_cases/5
  patch "/dart_cases/:id" do
    redirect "/dart_cases/:id"
  end

  # DELETE: /dart_cases/5/delete
  delete "/dart_cases/:id/delete" do
    redirect "/dart_cases"
  end
end
