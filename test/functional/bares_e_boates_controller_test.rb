require 'test_helper'

class BaresEBoatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => BaresEBoate.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    BaresEBoate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    BaresEBoate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bares_e_boate_url(assigns(:bares_e_boate))
  end
  
  def test_edit
    get :edit, :id => BaresEBoate.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    BaresEBoate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => BaresEBoate.first
    assert_template 'edit'
  end
  
  def test_update_valid
    BaresEBoate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => BaresEBoate.first
    assert_redirected_to bares_e_boate_url(assigns(:bares_e_boate))
  end
  
  def test_destroy
    bares_e_boate = BaresEBoate.first
    delete :destroy, :id => bares_e_boate
    assert_redirected_to bares_e_boates_url
    assert !BaresEBoate.exists?(bares_e_boate.id)
  end
end
