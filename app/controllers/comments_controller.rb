require 'sinatra/base'
require 'rack-flash'

class CommentsController < ApplicationController
use Rack::Flash
  #render edit form only if the selected comment is the current user's
  get '/comments/:id/edit' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    if logged_in?
      if @comment.chef_id == current_user.id
        erb :'/comments/edit'
      else
        flash[:message] = "**Sorry, you do not have permission to edit this comment.**"
        redirect "/restaurants/#{@restaurant.id}"
      end
    else
      redirect '/login'
    end
  end

  #edit and update the comment
  patch '/comments/:id' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    if logged_in?
      if @comment.chef_id == current_user.id
        if params[:comments][:content].empty?
          flash[:message] = "**The comment field cannot be blank.**"
          erb :'/comments/edit'
        else
          @comment.content = params[:comments][:content]
          @comment.save
          flash[:message] = "**Comment successfully updated.**"
          redirect "/restaurants/#{@restaurant.id}"
        end
      else
        flash[:message] = "**Sorry, you do not have permission to edit this comment.**"
        redirect "/restaurants/#{@restaurant.id}"
      end
    else
      redirect '/login'
    end
  end

  #delete a comment
  delete '/comments/:id/delete' do
    @comment = Comment.find(params[:id])
    @restaurant = @comment.restaurant

    if logged_in?
      if current_user.id == @comment.chef_id
        @comment.delete
        flash[:message] = "**Comment successfully deleted.**"
        redirect "/restaurants/#{@restaurant.id}"
      else
        flash[:message] = "**Sorry, you do not have permission to delete this comment.**"
        redirect "/restaurants/#{@restaurant.id}" 
      end
    else
      redirect '/login'
    end
  end


end
