require 'test_helper'

class ImovelLocacoesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ImovelLocacao.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ImovelLocacao.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ImovelLocacao.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to imovel_locacao_url(assigns(:imovel_locacao))
  end
  
  def test_edit
    get :edit, :id => ImovelLocacao.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ImovelLocacao.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ImovelLocacao.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ImovelLocacao.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ImovelLocacao.first
    assert_redirected_to imovel_locacao_url(assigns(:imovel_locacao))
  end
  
  def test_destroy
    imovel_locacao = ImovelLocacao.first
    delete :destroy, :id => imovel_locacao
    assert_redirected_to imovel_locacoes_url
    assert !ImovelLocacao.exists?(imovel_locacao.id)
  end
end
