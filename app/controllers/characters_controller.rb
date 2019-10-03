# frozen_string_literal: true

class CharactersController < ApplicationController
  # before_action :does_story_exist
  # params ==> id (character id) , user_id , story_id
  def index
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Character Not Found , Story is nil', status: 404
    else
      characters = current_story.characters
      render json: characters
    end
  end

  def show
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Character Not Found , Story is nil', status: 404
    else
      all_characters = current_story.characters
      if all_characters.include?(Character.find_by(id: params[:id]))
        character = Character.find_by(id: params[:id])
        render json: character
      else
        render json: 'Character Not Found in this Story', status: 404
      end
    end
  end

  def create
    character = Character.new(character_params)
    character.story_id = params[:story_id]
    if chapter.save?
      render json: character
    else
      render json: 'New Character did not save', status: 400
    end
  end

  def update
    p params
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Character not found, Story is nil', status: 404
    else
      if current_story.characters.include?(Character.find_by(id: params[:id]))
        character = Character.find_by(id: params[:id])
        p "Updating with params: #{params}"
        render json: character if character.update(character_params)
      else
        render json: 'Character does not exist in this Story', status: 404
      end
    end
  end

  def destroy
    # chapter = Chapter.find_by(id: params[:id])
    current_story = Story.find_by(id: params[:story_id], user_id: params[:user_id])
    if current_story.nil?
      render json: 'Story Not Found', status: 404
    else
      if current_story.characters.include?(Character.find_by(id: params[:id]))
        character = Character.find_by(id: params[:id])
        character_name = character.title
        character.delete
        render json: "Deleting '#{character_name}'"
      else
        render json: 'Character does not exist in this Story', status: 404
      end
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :height, :weight, :biography, :personality, :img_url, :appearance)
  end
end
