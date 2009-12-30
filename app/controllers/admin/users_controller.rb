class Admin::UsersController < ApplicationController
before_filter :login_required
  layout 'admin'

  def index
    @col = "col2-right"
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  def new
    @col = "col2-right"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to admin_users_url
    else
      render :action => 'new'
    end
  end

  def edit
    @col = "col2-right"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to admin_users_path
  end
end

