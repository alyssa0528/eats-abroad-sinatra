class CommentsController < ApplicationController

  get '/comments/:id/edit' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    if logged_in?
      if @comment.chef_id == current_user.id
        erb :'/comments/edit'
      else
        redirect "/restaurants/#{@comment.restaurant_id}"
      end
    else
      redirect '/login'
    end
  end

  
end
