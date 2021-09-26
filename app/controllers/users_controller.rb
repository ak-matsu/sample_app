class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user= User.new(params[:user]) #実装はまだ終わってない。
    if @user.save
      # 保存の成功をここで扱う
    else
      render 'new'
    end
  end
end
