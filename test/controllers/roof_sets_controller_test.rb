require 'test_helper'

class RoofSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roof_set = roof_sets(:one)
  end

  test "should get index" do
    get roof_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_roof_set_url
    assert_response :success
  end

  test "should create roof_set" do
    assert_difference('RoofSet.count') do
      post roof_sets_url, params: { roof_set: { description: @roof_set.description, name: @roof_set.name, slug: @roof_set.slug } }
    end

    assert_redirected_to roof_set_url(RoofSet.last)
  end

  test "should show roof_set" do
    get roof_set_url(@roof_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_roof_set_url(@roof_set)
    assert_response :success
  end

  test "should update roof_set" do
    patch roof_set_url(@roof_set), params: { roof_set: { description: @roof_set.description, name: @roof_set.name, slug: @roof_set.slug } }
    assert_redirected_to roof_set_url(@roof_set)
  end

  test "should destroy roof_set" do
    assert_difference('RoofSet.count', -1) do
      delete roof_set_url(@roof_set)
    end

    assert_redirected_to roof_sets_url
  end
end
