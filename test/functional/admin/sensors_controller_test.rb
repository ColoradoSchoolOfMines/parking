require 'test_helper'

class Admin::SensorsControllerTest < ActionController::TestCase
  setup do
    @admin_sensor = admin_sensors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sensors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_sensor" do
    assert_difference('Admin::Sensor.count') do
      post :create, admin_sensor: { api_token: @admin_sensor.api_token, lot_id: @admin_sensor.lot_id }
    end

    assert_redirected_to admin_sensor_path(assigns(:admin_sensor))
  end

  test "should show admin_sensor" do
    get :show, id: @admin_sensor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_sensor
    assert_response :success
  end

  test "should update admin_sensor" do
    put :update, id: @admin_sensor, admin_sensor: { api_token: @admin_sensor.api_token, lot_id: @admin_sensor.lot_id }
    assert_redirected_to admin_sensor_path(assigns(:admin_sensor))
  end

  test "should destroy admin_sensor" do
    assert_difference('Admin::Sensor.count', -1) do
      delete :destroy, id: @admin_sensor
    end

    assert_redirected_to admin_sensors_path
  end
end
