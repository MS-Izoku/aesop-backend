require 'jwt'
class UsersController < ApplicationController
  skip_before_action :authorized , only: [:create]
  def index
    users = User.all
    render json: users.to_json , only: [:username]
  end

  def profile
    render json: { user: current_user } , status: :accepted
  end

  def create
    user = User.create(user_params)
    if user.valid?
      @token = encode_token({user_id: user.id})
      render json: { user: user , jwt: @token} , status: :created
    else
      render json: {error: "Failed to Create user"} , status: :not_acceptable
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.to_json , only: [:current_story_id , :current_chapter_id]
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(user_update_params)
      render json: user.to_json
    else
      render json: {error: "Failed to Update User"} , status: :not_acceptable
    end
  end

  def set_current_story
    p "#{params[:user_id]} <<<<<<<<<<<< PARAMS <<<<<<"
    user = User.find_by(id: params[:user_id])
    user.update(current_story_id: params[:current_story_id])
    render json: user.to_json
  end

  def set_current_chapter
    user = User.find_by(id: params[:id])
    user.update(current_chapter_id: Story.find_by(id: params[:id]))
    render json: user.to_json
  end


  private
  def user_params
    params.require(:user).permit(:username , :password)
  end

  def user_update_params
    params.require(:user).permit(:username , :current_chapter_id , :current_story_id)
  end
end
