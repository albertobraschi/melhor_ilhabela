class Admin::EstabelecimentosController < ApplicationController
  #load_and_authorize_resource
before_filter :login_required
  layout "admin"

  def index
    @col = "col2-right"
    @estabelecimentos = Estabelecimento.all
  end

  def show
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:id])
    @caso = @estabelecimento.tipo_estabelecimento
    @resultado = case @caso
      when "BECN"
        @caso = BaresEBoate.find_by_estabelecimento_id(@estabelecimento.id)
      when "REST"
        @caso = Restaurante.find_by_estabelecimento_id(@estabelecimento.id)
      when "IPLT"
        @caso = ImovelLocacao.find_by_estabelecimento_id(@estabelecimento.id)
      when "HEPO"
        @caso = HoteisPousada.find_by_estabelecimento_id(@estabelecimento.id)
        @tarifarios = Tarifario.find_all_by_estabelecimento_id(@estabelecimento.id)
    end
  end

  def new
    @col = "col1"
    @estabelecimento = Estabelecimento.new
  end

  def create
    @estabelecimento = Estabelecimento.new(params[:estabelecimento])
    if @estabelecimento.save
        @redireciona_tipo_estabelecimento = @estabelecimento.tipo_estabelecimento
        case @redireciona_tipo_estabelecimento
          when "BECN" then redirect_to new_admin_estabelecimento_bares_e_boate_path(@estabelecimento)
          when "REST" then redirect_to new_admin_estabelecimento_restaurante_path(@estabelecimento)
          when "IPLT" then redirect_to new_admin_estabelecimento_imovel_locacao_path(@estabelecimento)
          when "HEPO" then redirect_to new_admin_estabelecimento_hoteis_pousada_path(@estabelecimento)
        else
          flash[:notice] = "falhou!"
          render :action => 'new'
        end
    else
      render :action => 'new'
    end
  end

  def edit
    @col = "col1"
    @estabelecimento = Estabelecimento.find(params[:id])
      if @estabelecimento.tipo_estabelecimento == "BECN"
        @bares_e_boate = BaresEBoate.find_by_estabelecimento_id(@estabelecimento.id)
      elsif @estabelecimento.tipo_estabelecimento == "REST"
        @restaurante = Restaurante.find_by_estabelecimento_id(@estabelecimento.id)
      elsif @estabelecimento.tipo_estabelecimento == "IPLT"
        @imovel_locacao = ImovelLocacao.find_by_estabelecimento_id(@estabelecimento.id)
      elsif @estabelecimento.tipo_estabelecimento == "HEPO"
        @hoteis_pousada = HoteisPousada.find_by_estabelecimento_id(@estabelecimento.id)
        @tarifario = Tarifario.new
        @tarifarios = Tarifario.find_all_by_estabelecimento_id(@estabelecimento)
      end
  end

  def update
    @estabelecimento = Estabelecimento.find(params[:id])
    @estabelecimento.attributes = params[:estabelecimento]
    @restaurante.attributes = params[:restaurante]
    if @estabelecimento.update_attributes(params[:estabelecimento])
      redirect_to admin_estabelecimentos_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @estabelecimento = Estabelecimento.find(params[:id])
    @estabelecimento.destroy
    redirect_to admin_estabelecimentos_url
  end
end

