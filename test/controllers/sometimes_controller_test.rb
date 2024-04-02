require "test_helper"

class SometimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sometime = sometimes(:one)
  end

  test "should get index" do
    get sometimes_url
    assert_response :success
  end

  test "should get new" do
    get new_sometime_url
    assert_response :success
  end

  test "should create sometime" do
    assert_difference("Sometime.count") do
      post sometimes_url, params: { sometime: { completed: @sometime.completed, name: @sometime.name, trip_id: @sometime.trip_id } }
    end

    assert_redirected_to sometime_url(Sometime.last)
  end

  test "should show sometime" do
    get sometime_url(@sometime)
    assert_response :success
  end

  test "should get edit" do
    get edit_sometime_url(@sometime)
    assert_response :success
  end

  test "should update sometime" do
    patch sometime_url(@sometime), params: { sometime: { completed: @sometime.completed, name: @sometime.name, trip_id: @sometime.trip_id } }
    assert_redirected_to sometime_url(@sometime)
  end

  test "should destroy sometime" do
    assert_difference("Sometime.count", -1) do
      delete sometime_url(@sometime)
    end

    assert_redirected_to sometimes_url
  end
end
