class Admin::FotosController < ApplicationController

  layout 'admin'

  def index
    @foto = Foto.all
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @foto = @estabelecimento.foto.build
  end

  def create
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @foto = @estabelecimento.foto.build(params[:foto])
    if @foto.save
      if params[:commit] =="voltar"
        redirect_to new_admin_estabelecimento_foto_url(@estabelecimento)
      else
        redirect_to admin_estabelecimentos_url
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy
    redirect_to :back
  end
end

