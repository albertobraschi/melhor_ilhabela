require 'test_helper'

class RestaurantesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Restaurante.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Restaurante.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Restaurante.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to restaurante_url(assigns(:restaurante))
  end
  
  def test_edit
    get :edit, :id => Restaurante.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Restaurante.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Restaurante.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Restaurante.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Restaurante.first
    assert_redirected_to restaurante_url(assigns(:restaurante))
  end
  
  def test_destroy
    restaurante = Restaurante.first
    delete :destroy, :id => restaurante
    assert_redirected_to restaurantes_url
    assert !Restaurante.exists?(restaurante.id)
  end
end
