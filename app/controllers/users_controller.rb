class UsersController < ApplicationController
  # show all users
  def index
    @user = User.all
    render json: {user: @user}, status: :ok
  end

  # show single user
  def show
    @user = User.where(id: params[:id], user_id: params[:user_id]).first
  end

  def new
    @user = User.new
  end
  # register new user
  def create
    data = User.new(JSON.parse(request.body.read))

    if data.save
      render json: {user: data}, status: :created
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
