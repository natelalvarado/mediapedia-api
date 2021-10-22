class MediaController < ApplicationController
  def index
    media = Medium.all
    render json: media.as_json
  end

  def create
    media 
  end
end
