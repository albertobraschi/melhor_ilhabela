class RestaurantesController < ApplicationController
  def index
    @restaurantes = Restaurante.all
  end
  
  def show
    @restaurante = Restaurante.find(params[:id])
  end
  
  def new
    @restaurante = Restaurante.new
  end
  
  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save
      flash[:notice] = "Successfully created restaurante."
      redirect_to @restaurante
    else
      render :action => 'new'
    end
  end
  
  def edit
    @restaurante = Restaurante.find(params[:id])
  end
  
  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(params[:restaurante])
      flash[:notice] = "Successfully updated restaurante."
      redirect_to @restaurante
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    flash[:notice] = "Successfully destroyed restaurante."
    redirect_to restaurantes_url
  end
end
