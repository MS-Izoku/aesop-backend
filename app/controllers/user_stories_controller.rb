# frozen_string_literal: true

class UserStoriesController < ApplicationController
  def show
    user_story = UserStory.find_by(id: params[:id])
    render json: UserStorySerializer.new(user_story)
  end

  def update
    user_story = UserStory.find_by(id: params[:id])
    if user_story.update(user_story_params)
      render json: "Updated Entry #{params[:id]}"
    end
  end

  def delete
    user_story.find_by(id: params[:id]).destroy
    render json: "Entry #{params[:id]} deleted"
  end

  private

  def user_story_params
    params.require(:user_story).permit(:role)
  end
end
