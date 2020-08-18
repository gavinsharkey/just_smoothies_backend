require 'test_helper'

class SmoothiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smoothy = smoothies(:one)
  end

  test "should get index" do
    get smoothies_url, as: :json
    assert_response :success
  end

  test "should create smoothy" do
    assert_difference('Smoothie.count') do
      post smoothies_url, params: { smoothy: { description: @smoothy.description, instructions: @smoothy.instructions, name: @smoothy.name } }, as: :json
    end

    assert_response 201
  end

  test "should show smoothy" do
    get smoothy_url(@smoothy), as: :json
    assert_response :success
  end

  test "should update smoothy" do
    patch smoothy_url(@smoothy), params: { smoothy: { description: @smoothy.description, instructions: @smoothy.instructions, name: @smoothy.name } }, as: :json
    assert_response 200
  end

  test "should destroy smoothy" do
    assert_difference('Smoothie.count', -1) do
      delete smoothy_url(@smoothy), as: :json
    end

    assert_response 204
  end
end
