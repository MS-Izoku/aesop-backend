class UsersController < ApplicationController
  def index
    users = User.all
 
    render json: UserSerializer.new(users)
  end

  def create
    user = User.new(user_creation_params)
    render json: "User '#{user.username}' Created" if user.save?
  end

  def show
    user = User.find_by(id: params[:id])
    render json: UserSerializer.new(user)
  end

  def update
    user = User.find_by(id: params[:id])
    render json: 'Account Updated' if user.update(user_update_params?)
  end

  def destroy
    Story.where(user_id: params[:id]).each do |story|
      Chapter.where(story_id: story.id).delete_all
    end
    UserStory.where(user_id: params[:id]).delete_all
    user = User.find_by(id: params[:id])
    username = user.name
    user.delete
    render json: "Deleting #{username} and all related file"
  end

  private

  def user_creation_params
    params.require(:user).permit(:username, :password, :email, :bio)
  end

  def user_update_params
    params.require(:user).permit(:password, :email, :bio)
  end
end
