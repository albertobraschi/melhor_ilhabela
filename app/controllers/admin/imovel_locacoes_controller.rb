class Admin::ImovelLocacoesController < ApplicationController
before_filter :login_required
  layout 'admin'

  def index
    @imovel_locacoes = ImovelLocacao.all
  end

  def show
    @imovel_locacao = ImovelLocacao.find(params[:id])
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @imovel_locacao = @estabelecimento.imovel_locacao.build
  end

  def create
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @imovel_locacao = @estabelecimento.imovel_locacao.build(params[:imovel_locacao])
    if @imovel_locacao.save
      redirect_to new_admin_estabelecimento_foto_path(@estabelecimento)
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
      redirect_to admin_estabelecimentos_path
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

