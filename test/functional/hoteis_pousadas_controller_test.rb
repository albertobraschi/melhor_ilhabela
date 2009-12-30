require 'test_helper'

class HoteisPousadasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => HoteisPousada.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    HoteisPousada.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    HoteisPousada.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hoteis_pousada_url(assigns(:hoteis_pousada))
  end
  
  def test_edit
    get :edit, :id => HoteisPousada.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    HoteisPousada.any_instance.stubs(:valid?).returns(false)
    put :update, :id => HoteisPousada.first
    assert_template 'edit'
  end
  
  def test_update_valid
    HoteisPousada.any_instance.stubs(:valid?).returns(true)
    put :update, :id => HoteisPousada.first
    assert_redirected_to hoteis_pousada_url(assigns(:hoteis_pousada))
  end
  
  def test_destroy
    hoteis_pousada = HoteisPousada.first
    delete :destroy, :id => hoteis_pousada
    assert_redirected_to hoteis_pousadas_url
    assert !HoteisPousada.exists?(hoteis_pousada.id)
  end
end
