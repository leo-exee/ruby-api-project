require "test_helper"

class ChampionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @champion = champions(:one)
  end

  test "should get index" do
    get champions_url, as: :json
    assert_response :success
  end

  test "should create champion" do
    assert_difference("Champion.count") do
      post champions_url, params: { champion: { difficulty: @champion.difficulty, name: @champion.name, price: @champion.price, role: @champion.role } }, as: :json
    end

    assert_response :created
  end

  test "should show champion" do
    get champion_url(@champion), as: :json
    assert_response :success
  end

  test "should update champion" do
    patch champion_url(@champion), params: { champion: { difficulty: @champion.difficulty, name: @champion.name, price: @champion.price, role: @champion.role } }, as: :json
    assert_response :success
  end

  test "should destroy champion" do
    assert_difference("Champion.count", -1) do
      delete champion_url(@champion), as: :json
    end

    assert_response :no_content
  end
end
