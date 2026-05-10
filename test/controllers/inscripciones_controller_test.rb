require "test_helper"

class InscripcionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inscripciones_index_url
    assert_response :success
  end

  test "should get create" do
    get inscripciones_create_url
    assert_response :success
  end

  test "should get destroy" do
    get inscripciones_destroy_url
    assert_response :success
  end
end
