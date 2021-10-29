class MediaController < ApplicationController

  before_action :authenticate_user

  def index
    media = current_user.media
    render json: media
  end

  def show
    medium = current_user.media.find(params[:id])
    render json: medium
  end

  def create
    medium = Medium.new(
      user_id: current_user.id,
      category: params[:category],
      title: params[:title],
      creator: params[:creator],
      genre: params[:genre],
      year: params[:year],
      image: params[:image],
      review: params[:review],
      rating: params[:rating],
      status: params[:status],
      cast: params[:cast],
      plot: params[:plot],
    )
    
    if medium.save
      render json: medium
    else
      render json: { errors: medium.errors.full_messages }, status: :bad_request
    end
  end

  def update 
    medium = current_user.media.find(params[:id])
    medium.category = params[:category] || media.category
    medium.title = params[:title] || medium.title
    medium.creator  = params[:creator] || medium.creator
    medium.genre  = params[:genre] || medium.genre
    medium.year  = params[:year] || medium.year
    medium.creator  = params[:creator] || medium.creator
    medium.image  = params[:image] || medium.image
    medium.review  = params[:review] || medium.review
    medium.rating  = params[:rating] || medium.rating
    medium.status  = params[:status] || medium.status
    medium.cast  = params[:cast] || medium.cast
    medium.plot  = params[:plot] || medium.plot
    medium.save

    if medium.save
      render json: medium
    else
      render json: { errors: medium.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    medium = current_user.media.find(params[:id])
    medium.destroy
    render json: {message: "Movie Successfully Destroyed"}
  end
end
