class Admin::TarifariosController < ApplicationController

  def new
    @tarifario = Tarifario.new
  end

  def create
    @tarifario = Tarifario.new(params[:tarifario])
    respond_to do |format|
      if @tarifario.save
        format.js
      else
        format.js
      end
    end
  end


  def destroy
    @tarifario = Tarifario.find(params[:id])
    @tarifario.destroy
    respond_to do |format|
        format.js
    end
  end
end

