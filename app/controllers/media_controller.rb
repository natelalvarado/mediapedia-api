class MediaController < ApplicationController
  def index
    media = Medium.where(:user_id => current_user.id)
    render json: media.as_json
  end

  def show
    media = Medium.find_by(id: params[:id], :user_id => current_user.id)

    if media.nil? 
      render json: { errors: "Unauthorized" }, status: :unauthorized
    else
      render json: media.as_json
    end
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
    media = Medium.find(params[:id], :user_id => current_user.id)
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

    if media.save
      render json: { message: "Media Successfully Updated" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    media = Medium.find_by(id: params[:id], :user_id => current_user.id)
    media.destroy
    render json: {message: "Movie Successfully Destroyed"}
  end
end
