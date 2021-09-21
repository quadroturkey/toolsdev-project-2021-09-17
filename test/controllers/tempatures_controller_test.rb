require 'test_helper'

class TempaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tempature = tempatures(:one)
  end

  test "should get index" do
    get tempatures_url
    assert_response :success
  end

  test "should get new" do
    get new_tempature_url
    assert_response :success
  end

  test "should create tempature" do
    assert_difference('Tempature.count') do
      post tempatures_url, params: { tempature: { date: @tempature.date, temp: @tempature.temp, time: @tempature.time } }
    end

    assert_redirected_to tempature_url(Tempature.last)
  end

  test "should show tempature" do
    get tempature_url(@tempature)
    assert_response :success
  end

  test "should get edit" do
    get edit_tempature_url(@tempature)
    assert_response :success
  end

  test "should update tempature" do
    patch tempature_url(@tempature), params: { tempature: { date: @tempature.date, temp: @tempature.temp, time: @tempature.time } }
    assert_redirected_to tempature_url(@tempature)
  end

  test "should destroy tempature" do
    assert_difference('Tempature.count', -1) do
      delete tempature_url(@tempature)
    end

    assert_redirected_to tempatures_url
  end
end
