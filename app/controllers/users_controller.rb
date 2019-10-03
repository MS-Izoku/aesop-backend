class UsersController < ApplicationController
  skip_before_action :authorized , only: [:create]
  def index
    users = User.all
    render json: users
  end

  def create
    p '==========================='
    p params
    @user = User.create(user_creation_params)
    if @user.valid?
      render json: @user.to_json , except: [:password], status: :created
    else
      p user_creation_params
      p '<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
      p params
      render json: {error: @user} , status: :not_acceptable
  
    end
  end


  def show
    user = User.find_by(id: params[:id])
    render json: user
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

  def profile
    render json: user.to_json , status: :accepted
  end

  private

  def user_creation_params
    params.require(:user).permit(:username, :password, :email)
  end

  def user_update_params
    params.require(:user).permit(:password, :email, :bio)
  end
end
