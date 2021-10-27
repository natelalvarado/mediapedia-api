class UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id], :user_id => current_user.id)

    if user.nil? 
      render json: { errors: "Unauthorized" }, status: :unauthorized
    else
      render json: media.as_json
    end  
  end

  def update
    puts params
    user = User.find(params[:id], :user_id => current_user.id)
    
    user.name = params[:name] || user.name
    user.email = params[:email] || user.email
    user.password  = params[:password] || user.password
    user.save
    
    if user.save
      render json: { message: "User Successfully Updated" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params[:id], :user_id => current_user.id)
    user.destroy
    render json: {message: "User successfully Deleted."}
  end
end
