# frozen_string_literal: true

class StoriesController < ApplicationController
  def index
    stories = Story.where(user_id: params[:user_id])
    # render json: StorySerializer.new(stories)
    render json: stories , include: [:chapters]
  end

  def create
    p params
    story = Story.new(story_params)
    story.user_id = params[:user_id]
    if story.save
      story.create_ownership
      Chapter.create(story_id: story.id , title: 'Chapter 1' , chapter_index: 1)
      render json: story , include: [:chapters]
    else
      render json: 'Failed to create new Story'
    end
  end

  def show
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    render json: story, include: [:chapters]
  end

  def update
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    if story.update(story_update_params)
      render json: story
    else
      render json: "Failed to Update '#{story.title}'"
    end
  end

  def destroy
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    story_title = story.title
    story.chapters.delete_all
    story.destroy
    render json: "Deleting #{story_title}"
  end

  private

  def story_params
    params.require(:story).permit(:title, :owner, :user_id)
  end

  def story_update_params
    params.require(:story).permit(:title , :high_concept , :pitch)
  end
end
