class SearchController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      @musics = Music.where("name like ? or artist like ?", "%" + params[:keyword] + "%", "%" + params[:keyword] + "%")
    end
  end
end
