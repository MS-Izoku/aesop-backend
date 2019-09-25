# frozen_string_literal: true

class FootnotesController < ApplicationController
  def index
    footnotes = Footnote.where(chapter_id: params[:chapter_id])
    render json: footnotes
  end

  def create
    footnote = Footnote.new(footnote_params)
    footnote.chapter_id = params[:chapter_id]
    if footnote.save
      render json: footnote
    else
      render json: 'Footnote failed to be created'
    end
  end

  def update
    footnote = FootNote.find_by(id: params[:id])
    if footnote.update(footnote_params)
      render json: footnote
    else
      render json: 'Footnote failed to update'
    end
  end

  def destroy
    Footnote.find_by(id: params[:id]).delete
    render json: 'Footnote deleted'
  end

  private

  def footnote_params
    params.require(:footnote).permit(:title, :body)
  end
end
