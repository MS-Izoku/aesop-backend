# frozen_string_literal: true

class ChaptersController < ApplicationController
  # params ==> id (chapter id) , user_id , story_id
  def index
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapters Not Found , Story is nil', status: 404
    else
      chapters = current_story.chapters
      render json: ChapterSerializer.new(chapters)
    end
  end

  def show
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapters Not Found , Story is nil' , status: 404
    else
      all_chapters = current_story.chapters
      if all_chapters.include?(Chapter.find_by(id: params[:id]))
        chapter = Chapter.find_by(id: params[:id])
        render json: ChapterSerializer.new(chapter)
      else
        render json: 'Chapter Not Found in this Story', status: 404
      end
    end
  end

  def create
    chapter = Chapter.new(chapter_params)
    chapter.story_id = params[:story_id]
    if chapter.save?
      render json: ChapterSerializer.new(chapter)
    else
      render json: 'New Chapter did not save', status: 400
    end
  end

  def update
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Chapter not found, Story is nil', status: 404
    else
      if current_story.chapters.include?(Chapter.where(id: params[:id])[0])
        chapter = Chapter.find_by(id: params[:id])
        if chapter.update(chapter_params)
          render json: ChapterSerializer.new(chapter)
        end
      else
        render json: 'Chapter does not exist in this Story', status: 404
      end
    end
  end

  def destroy
    # chapter = Chapter.find_by(id: params[:id])
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Story Not Found' , status: 404
    else
      if current_story.chapters.include?(Chapter.where(id: params[:id])[0])
        chapter = Chapter.find_by(id: params[:id])
        chapter_title = chapter.title
        chapter.delete
        render json: "Deleting '#{chapter_title}'"
      else
        render json: 'Chapter does not exist in this Story', status: 404
      end
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :body)
  end

  def chapter_update_params
    params.require(:chapter).permit(:title, :body)
  end
end
