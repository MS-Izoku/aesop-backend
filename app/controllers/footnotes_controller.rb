# frozen_string_literal: true
require 'jwt'
class FootnotesController < ApplicationController
  def index
    footnotes = Footnote.where(chapter_id: params[:chapter_id])
    render json: FootnoteSerializer.new(footnotes)
    #render json: footnotes.to_json
  end

  def create
    footnote = Footnote.new(footnote_params)
    footnote.chapter_id = params[:chapter_id]
    if footnote.save
      render json: footnote.to_json
    else
      render json: 'Footnote failed to be created'
    end
  end

  def show
    footnote = Footnote.find_by(id: params[:id])
    p footnote
    render json: footnote.to_json, include: [:created_at]
  end

  def update
    footnote = Footnote.find_by(id: params[:id])
    if footnote.update(footnote_params)
      render json: footnote.to_json
    else
      render json: 'Footnote failed to update'
    end
  end

  def destroy
    note = Footnote.find_by(id: params[:id])
    note.delete
    render json: note.to_json
  end

  private

  def footnote_params
    params.require(:footnote).permit(:title, :body)
  end
end
