class Admin::HoteisPousadasController < ApplicationController
before_filter :login_required
  layout 'admin'

  def index
    @hoteis_pousadas = HoteisPousada.all
  end

  def show
    @hoteis_pousada = HoteisPousada.find(params[:id])
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @hoteis_pousada = @estabelecimento.hoteis_pousada.build
    @tarifario = Tarifario.new
    @tarifarios = Tarifario.find_all_by_estabelecimento_id(@estabelecimento)
  end

  def create
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @hoteis_pousada = @estabelecimento.hoteis_pousada.build(params[:hoteis_pousada])
    @tarifario = Tarifario.new(params[:tarifario])
    if @hoteis_pousada.save
      redirect_to new_admin_estabelecimento_foto_path(@estabelecimento)
    else
      render :action => 'new'
    end
  end

  def edit
    @hoteis_pousada = HoteisPousada.find(params[:id])
  end

  def update
    @hoteis_pousada = HoteisPousada.find(params[:id])
    if @hoteis_pousada.update_attributes(params[:hoteis_pousada])
      redirect_to admin_estabelecimentos_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hoteis_pousada = HoteisPousada.find(params[:id])
    @hoteis_pousada.destroy
    redirect_to hoteis_pousadas_url
  end
end

