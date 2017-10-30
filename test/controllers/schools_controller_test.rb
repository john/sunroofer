require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { address: @school.address, city: @school.city, district: @school.district, latitude: @school.latitude, longitude: @school.longitude, name: @school.name, roof_sq_feet: @school.roof_sq_feet, state: @school.state, sunlight_hours: @school.sunlight_hours, utility: @school.utility, zipcode: @school.zipcode } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { address: @school.address, city: @school.city, district: @school.district, latitude: @school.latitude, longitude: @school.longitude, name: @school.name, roof_sq_feet: @school.roof_sq_feet, state: @school.state, sunlight_hours: @school.sunlight_hours, utility: @school.utility, zipcode: @school.zipcode } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
