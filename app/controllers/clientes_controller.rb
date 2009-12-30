class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end
  
  def show
    @cliente = Cliente.find(params[:id])
  end
  
  def new
    @cliente = Cliente.new
  end
  
  def create
    @cliente = Cliente.new(params[:cliente])
    if @cliente.save
      flash[:notice] = "Successfully created cliente."
      redirect_to @cliente
    else
      render :action => 'new'
    end
  end
  
  def edit
    @cliente = Cliente.find(params[:id])
  end
  
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(params[:cliente])
      flash[:notice] = "Successfully updated cliente."
      redirect_to @cliente
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    flash[:notice] = "Successfully destroyed cliente."
    redirect_to clientes_url
  end
end
