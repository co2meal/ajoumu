class MusicsController < ApplicationController
  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def upload
    @music = Music.new(params[:music])
    # raise @music.inspect

    respond_to do |format|
      if @music.save
        format.html { redirect_to root_path, :notice => "Music upload was successful!" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def download
    # raise 'gd'
    @music = Music.find(params[:music_id])
    path = "#{Rails.root}/public/#{@music.file}"
    send_file path, :type => @music.content_type, :disposition => "inline"
  end
end
