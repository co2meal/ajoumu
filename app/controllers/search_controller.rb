class SearchController < ApplicationController
  before_filter :authenticate_user!

  def index
    @keyword = params[:keyword]
    if @keyword.present?
      @musics = current_user.visible_musics.where("name like ? or artist like ?", "%" + params[:keyword] + "%", "%" + params[:keyword] + "%")
    end
  end
end
