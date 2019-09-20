# frozen_string_literal: true

class CharacterInChaptersController < ApplicationController
  def index
    chars_in_chapters = CharactersInChapter.all
    render json: chars_in_chapters
  end
end
