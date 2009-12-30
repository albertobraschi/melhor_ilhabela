class Admin::DashboardController < ApplicationController
before_filter :login_required
  #   habilita a autorização
  # load_and_authorize_resource

  layout "admin"

  def index
    @col = "col2-left"
    @clientes = Cliente.find(:all,:limit=>"5",:order=>"created_at DESC")
  end

end

