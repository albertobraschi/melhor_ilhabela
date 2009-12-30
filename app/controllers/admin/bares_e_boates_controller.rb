class Admin::BaresEBoatesController < ApplicationController

before_filter :login_required
  layout 'admin'

  def index
    @bares_e_boates = BaresEBoate.all
  end

  def show
    @bares_e_boate = BaresEBoate.find(params[:id])
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @bares_e_boate = @estabelecimento.bares_e_boate.build
  end

  def create
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @bares_e_boate = @estabelecimento.bares_e_boate.build(params[:bares_e_boate])
    if @bares_e_boate.save
      redirect_to new_admin_estabelecimento_foto_path(@estabelecimento)
    else
      render :action => 'new'
    end
  end

  def edit
    @col = "col1"
    @bares_e_boate = BaresEBoate.find(params[:id])
  end

  def update
    @bares_e_boate = BaresEBoate.find(params[:id])
    if @bares_e_boate.update_attributes(params[:bares_e_boate])
      redirect_to admin_estabelecimentos_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bares_e_boate = BaresEBoate.find(params[:id])
    @bares_e_boate.destroy
    redirect_to bares_e_boates_url
  end
end

