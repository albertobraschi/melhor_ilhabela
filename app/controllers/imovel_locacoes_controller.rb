class ImovelLocacoesController < ApplicationController
  def index
    @imovel_locacoes = ImovelLocacao.all
  end
  
  def show
    @imovel_locacao = ImovelLocacao.find(params[:id])
  end
  
  def new
    @imovel_locacao = ImovelLocacao.new
  end
  
  def create
    @imovel_locacao = ImovelLocacao.new(params[:imovel_locacao])
    if @imovel_locacao.save
      flash[:notice] = "Successfully created imovel locacao."
      redirect_to @imovel_locacao
    else
      render :action => 'new'
    end
  end
  
  def edit
    @imovel_locacao = ImovelLocacao.find(params[:id])
  end
  
  def update
    @imovel_locacao = ImovelLocacao.find(params[:id])
    if @imovel_locacao.update_attributes(params[:imovel_locacao])
      flash[:notice] = "Successfully updated imovel locacao."
      redirect_to @imovel_locacao
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @imovel_locacao = ImovelLocacao.find(params[:id])
    @imovel_locacao.destroy
    flash[:notice] = "Successfully destroyed imovel locacao."
    redirect_to imovel_locacoes_url
  end
end
