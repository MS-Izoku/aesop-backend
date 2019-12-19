# frozen_string_literal: true

class StoriesController < ApplicationController
  def index
    stories = Story.where(user_id: params[:user_id]).includes({ chapters: [:footnotes] }, :characters).to_a
    options = {
      include: %i[
        chapters
        characters
      ]
    }

    render json: StorySerializer.new(stories, options)
  end

  def minimal_index
    stories = Story.where(user_id: params[:user_id]).includes({ chapters: [:footnotes] }, :characters).to_a
    render json: StoryViewSerializer.new(stories)
  end

  def create
    story = Story.new(story_params)
    story.user_id = params[:user_id]
    if story.save
      story.create_ownership
      Chapter.create(story_id: story.id, title: 'Preface', chapter_index: 1)
      options = { include: %i[chapters characters] }
      render json: StorySerializer.new(story, options)
      # render json: story , include: [:characters , :chapters => {include: [:footnotes , :characters]}]
    else
      render json: { error: 'Failed to create new Story' }, status: 400
    end
  end

  def show
    #story = Story.find_by(id: params[:id], user_id: params[:user_id])
    story = Story.includes({chapters: [:footnotes]} , :characters).where(id: params[:id] , user_id: params[:user_id]).to_a
    options = { include: %i[chapters characters] }
    # options = {}
    render json: StorySerializer.new(story, options)
  end

  def update
    story = Story.find_by(id: params[:id], user_id: params[:user_id])
    if story.update(story_update_params)
      options = { include: %i[chapters footnotes] }
      render json: StorySerializer.new(story, options)
    else
      render json: { error: "Failed to Update '#{story.title}'" }, status: 400
    end
  end

  def destroy
    story = Story.find_by(id: params[:id], user_id: params[:user_id])
    render json: { error: 'Story Not Found' }, status: 404 unless story
    story.chapters.delete_all
    story.destroy
    options = { include: %i[chapters footnotes] }
    render json: StorySerializer.new(story, options)
    # render json: story.to_json, include: [:characters , :chapters => {include: [:footnotes , :characters]}]
  end

  private

  def story_params
    params.require(:story).permit(:title, :owner, :user_id)
  end

  def story_update_params
    params.require(:story).permit(:title, :high_concept, :pitch)
  end
end
