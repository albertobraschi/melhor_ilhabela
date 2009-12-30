class HoteisPousadasController < ApplicationController
  def index
    @hoteis_pousadas = HoteisPousada.all
  end
  
  def show
    @hoteis_pousada = HoteisPousada.find(params[:id])
  end
  
  def new
    @hoteis_pousada = HoteisPousada.new
  end
  
  def create
    @hoteis_pousada = HoteisPousada.new(params[:hoteis_pousada])
    if @hoteis_pousada.save
      flash[:notice] = "Successfully created hoteis pousada."
      redirect_to @hoteis_pousada
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
      flash[:notice] = "Successfully updated hoteis pousada."
      redirect_to @hoteis_pousada
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @hoteis_pousada = HoteisPousada.find(params[:id])
    @hoteis_pousada.destroy
    flash[:notice] = "Successfully destroyed hoteis pousada."
    redirect_to hoteis_pousadas_url
  end
end
