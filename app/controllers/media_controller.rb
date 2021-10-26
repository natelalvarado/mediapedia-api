class MediaController < ApplicationController
  def index
    puts current_user
    media = Medium.all
    render json: media.as_json
  end

  def show
    media = Medium.find_by(id: params[:id])
    render json: media.as_json
  end

  def create
    media = Medium.new(
      user_id: params[:user_id],
      media_type: params[:media_type],
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
    
    if media.save
      render json: { message: "Media created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update 
    media = Medium.find(params[:id])
    media.media_type = params[:media_type] || media.media_type
    media.title = params[:title] || media.title
    media.creator  = params[:creator] || media.creator
    media.genre  = params[:genre] || media.genre
    media.year  = params[:year] || media.year
    media.creator  = params[:creator] || media.creator
    media.image  = params[:image] || media.image
    media.review  = params[:review] || media.review
    media.rating  = params[:rating] || media.rating
    media.status  = params[:status] || media.status
    media.cast  = params[:cast] || media.cast
    media.plot  = params[:plot] || media.plot
    media.save
    render json: media.as_json
  end

  def destroy
    media = Medium.find_by(id: params[:id])
    media.destroy
    render json: {message: "Media successfully Deleted."}
  end
end
