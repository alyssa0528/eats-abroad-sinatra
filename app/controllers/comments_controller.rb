class CommentsController < ApplicationController

  #render edit form only if the selected comment is the current user's
  get '/comments/:id/edit' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    if logged_in?
      if @comment.chef_id == current_user.id
        erb :'/comments/edit'
      else
        redirect "/restaurants/#{@restaurant.id}" #raise error saying user doesn't have permission to edit
      end
    else
      redirect '/login'
    end
  end

  #edit and update the comment
  patch '/comments/:id' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    binding.pry

    if logged_in?
      if @comment.chef_id == current_user.id
        if params[:comments][:content].empty? #if the submitted comment is blank
          erb :'/comments/edit' #raise error saying that a comment cannot be blank!
        else
          @comment.content = params[:comments][:content] #update @comment's content value with the new comment
          @comment.save #save to db
          redirect "/restaurants/#{@restaurant.id}" #redirect to restaurant's page
        end
      else
        redirect "/restaurants/#{@restaurant.id}" #raise error saying user doesn't have permission to edit
      end
    else
      redirect '/login'
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
