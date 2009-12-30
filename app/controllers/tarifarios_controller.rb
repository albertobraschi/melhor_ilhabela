class TarifariosController < ApplicationController
  def index
    @tarifarios = Tarifario.all
  end
  
  def show
    @tarifario = Tarifario.find(params[:id])
  end
  
  def new
    @tarifario = Tarifario.new
  end
  
  def create
    @tarifario = Tarifario.new(params[:tarifario])
    if @tarifario.save
      flash[:notice] = "Successfully created tarifario."
      redirect_to @tarifario
    else
      render :action => 'new'
    end
  end
  
  def edit
    @tarifario = Tarifario.find(params[:id])
  end
  
  def update
    @tarifario = Tarifario.find(params[:id])
    if @tarifario.update_attributes(params[:tarifario])
      flash[:notice] = "Successfully updated tarifario."
      redirect_to @tarifario
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tarifario = Tarifario.find(params[:id])
    @tarifario.destroy
    flash[:notice] = "Successfully destroyed tarifario."
    redirect_to tarifarios_url
  end
end
