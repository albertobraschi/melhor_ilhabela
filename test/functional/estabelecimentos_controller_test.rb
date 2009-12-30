require 'test_helper'

class EstabelecimentosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Estabelecimento.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Estabelecimento.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Estabelecimento.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to estabelecimento_url(assigns(:estabelecimento))
  end
  
  def test_edit
    get :edit, :id => Estabelecimento.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Estabelecimento.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Estabelecimento.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Estabelecimento.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Estabelecimento.first
    assert_redirected_to estabelecimento_url(assigns(:estabelecimento))
  end
  
  def test_destroy
    estabelecimento = Estabelecimento.first
    delete :destroy, :id => estabelecimento
    assert_redirected_to estabelecimentos_url
    assert !Estabelecimento.exists?(estabelecimento.id)
  end
end
