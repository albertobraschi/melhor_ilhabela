class BaresEBoatesController < ApplicationController
  def index
    @bares_e_boates = BaresEBoate.all
  end
  
  def show
    @bares_e_boate = BaresEBoate.find(params[:id])
  end
  
  def new
    @bares_e_boate = BaresEBoate.new
  end
  
  def create
    @bares_e_boate = BaresEBoate.new(params[:bares_e_boate])
    if @bares_e_boate.save
      flash[:notice] = "Successfully created bares e boate."
      redirect_to @bares_e_boate
    else
      render :action => 'new'
    end
  end
  
  def edit
    @bares_e_boate = BaresEBoate.find(params[:id])
  end
  
  def update
    @bares_e_boate = BaresEBoate.find(params[:id])
    if @bares_e_boate.update_attributes(params[:bares_e_boate])
      flash[:notice] = "Successfully updated bares e boate."
      redirect_to @bares_e_boate
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bares_e_boate = BaresEBoate.find(params[:id])
    @bares_e_boate.destroy
    flash[:notice] = "Successfully destroyed bares e boate."
    redirect_to bares_e_boates_url
  end
end
