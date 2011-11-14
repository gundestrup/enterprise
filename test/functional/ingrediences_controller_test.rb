require File.dirname(__FILE__) + '/../test_helper'

class IngrediencesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ingrediences)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ingredience
    assert_difference('Ingredience.count') do
      post :create, :ingredience => { }
    end

    assert_redirected_to ingredience_path(assigns(:ingredience))
  end

  def test_should_show_ingredience
    get :show, :id => ingrediences(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ingrediences(:one).id
    assert_response :success
  end

  def test_should_update_ingredience
    put :update, :id => ingrediences(:one).id, :ingredience => { }
    assert_redirected_to ingredience_path(assigns(:ingredience))
  end

  def test_should_destroy_ingredience
    assert_difference('Ingredience.count', -1) do
      delete :destroy, :id => ingrediences(:one).id
    end

    assert_redirected_to ingrediences_path
  end
end
