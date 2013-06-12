class MusicsController < ApplicationController
  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def upload
    @music = Music.new(params[:music])
    @music.user = current_user

    respond_to do |format|
      if @music.save
        format.html { redirect_to root_path, :notice => "Music upload was successful!" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def download
    @music = Music.find(params[:music_id])

    if @music.category == 'public'
      if current_user.credit < 10
        raise 'credit is not enough.'
      end

      current_user.transaction do
        current_user.credit -= 10
        @music.user.credit += 10

        current_user.save!
        @music.user.save!
      end
    end

    path = "#{Rails.root}/public/#{@music.file}"
    send_file path, :type => @music.content_type, :disposition => "inline"
  end
end
