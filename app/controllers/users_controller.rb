class UsersController < ApplicationController

  before_action :authenticate_user, except: :create

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    render json: current_user
  end

  def update
    puts params
    user = current_user
    
    user.name = params[:name] || user.name
    user.email = params[:email] || user.email
    user.password  = params[:password] || user.password
    
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: {message: "User successfully Deleted."}
  end
end
