class RestaurantsController < ApplicationController

  #shows list of all recommended restaurants
  get '/restaurants' do
    if logged_in?
      erb :'/restaurants/index'
    else
      redirect '/login'
    end
  end

  #renders form to submit a new restaurant and comment
  get '/restaurants/new' do
    if logged_in?
      erb :'/restaurants/new'
    else
      redirect '/login'
    end
  end

  #adds new restaurant and comment
  post '/restaurants' do
    if logged_in?
      if params[:restaurant].empty? && params[:comments].empty? #if user submits totally blank form
        redirect '/restaurants/new' # error message asking chef to please select or add a restaurant
      elsif params[:comments][:content].empty?
        redirect '/restaurants/new' #error message here that comment field cannot be empty
      elsif params[:restaurant][:name].empty? #if a user selects an existing restaurant from the list
        @restaurant = Restaurant.find_by(:id => params[:restaurant][:id])
        #@restaurant.chefs << Chef.new(:name => current_user.name)
        @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
        redirect "/restaurants/#{@restaurant.id}"
      else
        @restaurant = Restaurant.new(params[:restaurant]) #if a brand new restaurant is added by user w/all inputs filled out
        @restaurant.save #saves to database and creates a @restaurant ID
        @restaurant.comments << Comment.new(:content => params[:comments][:content], :chef_id => current_user.id)
        redirect "/restaurants/#{@restaurant.id}"
      end
    else
      redirect '/login'
    end
  end

  #show individual restaurant page
  get '/restaurants/:id' do
    @restaurant = Restaurant.find_by(id: params[:id])
    if logged_in?
      erb :"/restaurants/show"
    else
      redirect '/login'
    end
  end

  #render restaurant edit form
  get '/restaurants/:id/edit' do
    if logged_in?
      @restaurant = Restaurant.find_by(id: params[:id])
      binding.pry
      if @comment.chef_id == current_user.id
        erb :'/restaurants/edit'
      else
        redirect "/restaurants/#{@restaurant.id}"
      end
      #binding.pry
      #if Comment.find_by(chef_id: current_user.id, restaurant_id: params[:id]) #if this is true
      #  @comments = Comment.where(restaurant_id: params[:id])

      #  @comments.each do |c|
      #    binding.pry
      #    c.user_id == current_user.id ? erb :'/restaurants/edit' : redirect "/restaurants/#{@restaurant.id}"
      #    @comment = c
      #  end
        #if current_user

        #else

        #end
    else
      redirect '/login'
    end
  end



  #    @comments = Comment.where(restaurant_id: params[:id]) #an array of comments
  #    @comments.each do |comment| #iterate through array, check each comment to see if its user_id matches current_user.id
  #      if comment.chef_id != current_user.id
  #        redirect "/restaurants/#{@restaurant.id}" #have error message appear
  #      else
  #        @comment = comment
  #        erb :'/restaurants/edit'
  #      end
  #    end
  #  else
  #    redirect '/login'
  #  end
  #end

  #edit and update the comment
  patch '/restaurants/:id' do
    @restaurant = Restaurant.find_by(id: params[:id])
    @comment = Comment.find_by(restaurant_id: params[:id])
    if logged_in? && @comment.chef_id == current_user.id
      if params[:comments][:content].empty?
        erb :'/restaurants/edit' #raise error saying that a comment cannot be blank!
      else
        @comment.content = params[:comments][:content]
        @comment.save
        redirect "/restaurants/#{@restaurant.id}"
      end
    else
      redirect "/restaurants/#{@restaurant.id}" #add error msg: you do not have permission to edit this comment
    end
  end

  #delete a comment
  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find_by(id: params[:id])
    @comment = Comment.find_by(restaurant_id: params[:id])
    binding.pry
    if logged_in? && current_user.id == @comment.chef_id
      @comment.delete
      redirect '/restaurants'
    else
      redirect "/restaurants/#{@restaurant.id}" #error message
    end
  end

end
