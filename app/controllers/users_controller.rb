class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_resourse, only: [:show, :edit, :update, :change_permission]

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def change_permission
      @user.update(admin: !@user.admin)
      redirect_to :back
    end

  private
 
    def current_resourse
      @user = User.find(params[:id])
    end

    def set_user
      @user = current_user
    end
    
    def user_params
      params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :avatar)
    end
end