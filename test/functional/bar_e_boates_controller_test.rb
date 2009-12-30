require 'test_helper'

class BarEBoatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => BarEBoate.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    BarEBoate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    BarEBoate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bar_e_boate_url(assigns(:bar_e_boate))
  end
  
  def test_edit
    get :edit, :id => BarEBoate.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    BarEBoate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => BarEBoate.first
    assert_template 'edit'
  end
  
  def test_update_valid
    BarEBoate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => BarEBoate.first
    assert_redirected_to bar_e_boate_url(assigns(:bar_e_boate))
  end
  
  def test_destroy
    bar_e_boate = BarEBoate.first
    delete :destroy, :id => bar_e_boate
    assert_redirected_to bar_e_boates_url
    assert !BarEBoate.exists?(bar_e_boate.id)
  end
end
