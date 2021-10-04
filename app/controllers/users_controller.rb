class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      
      # redirect_to user_url(@user) この省略が下記コード
      redirect_to @user
      # 保存の成功をここで扱う
      
    else
      render 'new'
    end
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name,:email,:password,
      :password_confirmation)
    end
end
