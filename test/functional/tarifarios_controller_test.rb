require 'test_helper'

class TarifariosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Tarifario.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Tarifario.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Tarifario.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tarifario_url(assigns(:tarifario))
  end
  
  def test_edit
    get :edit, :id => Tarifario.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Tarifario.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tarifario.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Tarifario.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tarifario.first
    assert_redirected_to tarifario_url(assigns(:tarifario))
  end
  
  def test_destroy
    tarifario = Tarifario.first
    delete :destroy, :id => tarifario
    assert_redirected_to tarifarios_url
    assert !Tarifario.exists?(tarifario.id)
  end
end
