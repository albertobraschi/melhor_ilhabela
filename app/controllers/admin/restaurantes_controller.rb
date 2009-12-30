class Admin::RestaurantesController < ApplicationController
before_filter :login_required
  layout 'admin'

  def index
    @restaurantes = Restaurante.all
  end

  def show
    @restaurante = Restaurante.find(params[:id])
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @restaurante = @estabelecimento.restaurante.build
  end

  def create
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @restaurante = @estabelecimento.restaurante.build(params[:restaurante])
    if @restaurante.save
      redirect_to new_admin_estabelecimento_foto_path(@estabelecimento)
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
      redirect_to admin_estabelecimentos_path
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

