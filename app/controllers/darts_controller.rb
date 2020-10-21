class DartsController < ApplicationController
  before "/darts*" do
    redirect_if_not_logged_in
  end

  # GET: /darts
  get "/dart_sets/:dart_set_id/darts" do
    @dart_set = current_user.dart_sets.find(params[:dart_set_id])
    @darts = @dart_set.darts
    erb :"/darts/index"
  end

  # GET: /darts/new
  get "/dart_sets/:dart_set_id/darts/new" do
    @dart_set = current_user.dart_sets.find(params[:dart_set_id])
    @dart = @dart_set.darts.new
    erb :"/darts/new"
  end

  # POST: /darts
  post "/dart_sets/:dart_set_id/darts" do
    @dart_set = current_user.dart_sets.find(params[:dart_set_id])
    @darts = @dart_set.darts.new(params)
    if params[:body].to_i.between?(18, 50) #&& params[:body].match(/^[1-9][0-9]?$|^50$/)
      @darts.save
      redirect "/dart_sets/#{ @dart_set.id }"
    else
      !params[:body].to_i.between?(18, 50)
      @error_message = "Body must be a numerical weight between 18g and 50g. Please try again."
      redirect "/dart_sets/#{@dart_set.id}/darts/new"
    end
  end

  # GET: /darts/5
  get "/darts/:id" do
    @user = User.find(params[:id])
    @dart = current_user.darts.find(params[:id])
    erb :"/darts/show"
  end

  # GET: /darts/5/edit
  get "/darts/:id/edit" do
    @dart = current_user.darts.find(params[:id])
    if params[:body].to_i.between?(18, 50) #&& params[:body].match(/^[1-9][0-9]?$|^50$/)
      @dart.save
      redirect "/darts/#{ @dart.id }"
    else 
      !params[:body].to_i.between?(18, 50)
      @error_message = "Body must be a numerical weight between 18g and 50g. Please try again."
      erb :'darts/edit'
    end
  end

  # PATCH: /darts/5
  patch "/darts/:id" do
    @dart = current_user.dart.find(params[:id])
    if params[:body].to_i.between?(18, 50) #&& params[:body].match(/^[1-9][0-9]?$|^50$/)
      if @darts.update(params.except(:id, :_method))
        redirect "/darts/#{ @dart.id }"
      end
    else 
      !params[:body].to_i.between?(18, 50)
      @error_message = "Body must be a numerical weight between 18g and 50g. Please try again."
      erb :'darts/edit'
    end
  end

  # DELETE: /darts/5/delete
  delete "/darts/:id/delete" do
    @dart = current_user.darts.find(params[:id])
    @dart.destroy
    redirect "/dart_sets/#{ @dart.dart_set_id }"
    # redirect "/darts"
  end
end

#some functionality to add a dart to a set
#but before actually doing that, ask if there are 3 darts in that set already
#if so, say in a flash message "set is full!"
#otherwise, assign the dart to that set i.e. set the set_id of the dart equal to the set.id