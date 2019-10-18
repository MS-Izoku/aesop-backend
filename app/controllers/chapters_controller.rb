# frozen_string_literal: true

class ChaptersController < ApplicationController
  #   # params ==> id (chapter id) , user_id , story_id
  def index
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapters Not Found , Story is nil', status: 404
    else
      chapters = current_story.chapters
      render json: chapters
    end
  end

  def create
    current_story = Story.find_by(id: params[:story_id])
    if current_story.nil?
      render json: 'No Story Found to Post to'
    else
      chapter = Chapter.new(chapter_params)
      chapter_count = current_story.chapters.count
      chapter_count = 1 if chapter_count === 0
      chapter.chapter_index = chapter_count
      chapter.story_id = current_story.id
      if chapter.save
        render json: chapter
      else
        render json: 'Chapter Failed to Save'
      end
    end
  end

  def show
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapters Not Found , Story is nil', status: 404
    else
      all_chapters = current_story.chapters
      if all_chapters.include?(Chapter.find_by(id: params[:id]))
        chapter = Chapter.find_by(id: params[:id])
        render json: chapter
      else
        render json: 'Chapter Not Found in this Story', status: 404
      end
    end

    # story = Story.find_by(id: params[:id])
  end

  def update
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapter not found, Story is nil', status: 404
    else
      if current_story.chapters.include?(Chapter.where(id: params[:id])[0])
        chapter = Chapter.find_by(id: params[:id])
        render json: chapter if chapter.update(chapter_params)
      else
        render json: 'Chapter does not exist in this Story', status: 404
      end
    end
  end

  def destroy
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Story Not Found', status: 404
    else
      if current_story.chapters.include?(Chapter.where(id: params[:id])[0])
        chapter = Chapter.find_by(id: params[:id])
        chapter.delete
        render json: chapter.to_json
      else
        render json: 'Chapter does not exist in this Story', status: 404
      end
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :body, :story_id)
  end

  def chapter_update_params
    params.require(:chapter).permit(:title, :body)
  end
end
