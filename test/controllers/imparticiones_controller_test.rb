require "test_helper"

class ImparticionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imparticiones_index_url
    assert_response :success
  end

  test "should get create" do
    get imparticiones_create_url
    assert_response :success
  end

  test "should get show" do
    get imparticiones_show_url
    assert_response :success
  end
end
