class EstabelecimentosController < ApplicationController
  def index
    @estabelecimentos = Estabelecimento.all
  end
  
  def show
    @estabelecimento = Estabelecimento.find(params[:id])
  end
  
  def new
    @estabelecimento = Estabelecimento.new
  end
  
  def create
    @estabelecimento = Estabelecimento.new(params[:estabelecimento])
    if @estabelecimento.save
      flash[:notice] = "Successfully created estabelecimento."
      redirect_to @estabelecimento
    else
      render :action => 'new'
    end
  end
  
  def edit
    @estabelecimento = Estabelecimento.find(params[:id])
  end
  
  def update
    @estabelecimento = Estabelecimento.find(params[:id])
    if @estabelecimento.update_attributes(params[:estabelecimento])
      flash[:notice] = "Successfully updated estabelecimento."
      redirect_to @estabelecimento
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @estabelecimento = Estabelecimento.find(params[:id])
    @estabelecimento.destroy
    flash[:notice] = "Successfully destroyed estabelecimento."
    redirect_to estabelecimentos_url
  end
end
