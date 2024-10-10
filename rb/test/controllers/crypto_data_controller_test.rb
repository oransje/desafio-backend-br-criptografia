require "test_helper"

class CryptoDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto_datum = crypto_data(:one)
  end

  test "should get index" do
    get crypto_data_url, as: :json
    assert_response :success
  end

  test "should create crypto_datum" do
    assert_difference("CryptoDatum.count") do
      post crypto_data_url, params: { crypto_datum: { credit_card_token: @crypto_datum.credit_card_token, user_document: @crypto_datum.user_document, value: @crypto_datum.value } }, as: :json
    end

    assert_response :created
  end

  test "should show crypto_datum" do
    get crypto_datum_url(@crypto_datum), as: :json
    assert_response :success
  end

  test "should update crypto_datum" do
    patch crypto_datum_url(@crypto_datum), params: { crypto_datum: { credit_card_token: @crypto_datum.credit_card_token, user_document: @crypto_datum.user_document, value: @crypto_datum.value } }, as: :json
    assert_response :success
  end

  test "should destroy crypto_datum" do
    assert_difference("CryptoDatum.count", -1) do
      delete crypto_datum_url(@crypto_datum), as: :json
    end

    assert_response :no_content
  end
end
