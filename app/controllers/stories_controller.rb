# frozen_string_literal: true

class StoriesController < ApplicationController
  def index
    stories = Story.where(user_id: params[:user_id])
    # render json: stories , include: [:chapters => {include: [:footnotes]}]
    render json: stories , include: [:characters , :chapters => {include: [:footnotes , :characters]}]
  end

  def create
    story = Story.new(story_params)
    story.user_id = params[:user_id]
    if story.save
      story.create_ownership
      Chapter.create(story_id: story.id , title: 'Preface' , chapter_index: 1)
      render json: story , include: [:characters , :chapters => {include: [:footnotes , :characters]}]
    else
      render json: 'Failed to create new Story'
    end
  end

  def show
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    render json: story, include: [:characters , :chapters => {include: [:footnotes]}]
  end

  def update
    p "#UPDATING <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    if story.update(story_update_params)
      render json: story, include: [:characters , :chapters => {include: [:footnotes , :charcters]}]
    else
      render json: "Failed to Update '#{story.title}'"
    end
  end

  def destroy
    story = Story.find_by(id: params[:id] , user_id: params[:user_id])
    story.chapters.delete_all
    story.destroy
    render json: story.to_json, include: [:characters , :chapters => {include: [:footnotes , :characters]}]
  end

  private

  def story_params
    params.require(:story).permit(:title, :owner, :user_id)
  end

  def story_update_params
    params.require(:story).permit(:title , :high_concept , :pitch)
  end
end
