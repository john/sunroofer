require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building = buildings(:one)
  end

  test "should get index" do
    get buildings_url
    assert_response :success
  end

  test "should get new" do
    get new_building_url
    assert_response :success
  end

  test "should create building" do
    assert_difference('Building.count') do
      post buildings_url, params: { building: { address: @building.address, city: @building.city, description: @building.description, district: @building.district, latitude: @building.latitude, longitude: @building.longitude, name: @building.name, roof_set_id: @building.roof_set_id, roof_sq_feet: @building.roof_sq_feet, slug: @building.slug, state: @building.state, sunlight_hours: @building.sunlight_hours, utility: @building.utility, zipcode: @building.zipcode } }
    end

    assert_redirected_to building_url(Building.last)
  end

  test "should show building" do
    get building_url(@building)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_url(@building)
    assert_response :success
  end

  test "should update building" do
    patch building_url(@building), params: { building: { address: @building.address, city: @building.city, description: @building.description, district: @building.district, latitude: @building.latitude, longitude: @building.longitude, name: @building.name, roof_set_id: @building.roof_set_id, roof_sq_feet: @building.roof_sq_feet, slug: @building.slug, state: @building.state, sunlight_hours: @building.sunlight_hours, utility: @building.utility, zipcode: @building.zipcode } }
    assert_redirected_to building_url(@building)
  end

  test "should destroy building" do
    assert_difference('Building.count', -1) do
      delete building_url(@building)
    end

    assert_redirected_to buildings_url
  end
end
