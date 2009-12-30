class Admin::ClientesController < ApplicationController

  layout 'admin'

  def index
    @col = "col2-right"
    if params[:search]
      @clientes = Cliente.search(params[:search])
    else
      @clientes = Cliente.all
    end
  end

  def show
    @col = "col1"
    @cliente = Cliente.find(params[:id])
  end

  def new
    @col = "col1"
    @cliente = Cliente.new
  end

  def create
    @col = "col1"
    @cliente = Cliente.new(params[:cliente])
    if @cliente.save
      flash[:notice] = "Successfully created cliente."
      redirect_to admin_clientes_path
    else
      render :action => 'new'
    end
  end

  def edit
    @col = "col1"
    @cliente = Cliente.find(params[:id])
  end

  def update
    @col = "col1"
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(params[:cliente])
      flash[:notice] = "Successfully updated cliente."
      redirect_to admin_clientes_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @col = "col1"
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    flash[:notice] = "Successfully destroyed cliente."
    redirect_to admin_clientes_path
  end
end

