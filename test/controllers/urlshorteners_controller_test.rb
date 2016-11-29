require 'test_helper'

class UrlshortenersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urlshortener = urlshorteners(:one)
  end

  test "should get index" do
    get urlshorteners_url
    assert_response :success
  end

  test "should get new" do
    get new_urlshortener_url
    assert_response :success
  end

  test "should create urlshortener" do
    assert_difference('Urlshortener.count') do
      post urlshorteners_url, params: { urlshortener: { clicks: @urlshortener.clicks, shortened: @urlshortener.shortened, url: @urlshortener.url } }
    end

    assert_redirected_to urlshortener_url(Urlshortener.last)
  end

  test "should show urlshortener" do
    get urlshortener_url(@urlshortener)
    assert_response :success
  end

  test "should get edit" do
    get edit_urlshortener_url(@urlshortener)
    assert_response :success
  end

  test "should update urlshortener" do
    patch urlshortener_url(@urlshortener), params: { urlshortener: { clicks: @urlshortener.clicks, shortened: @urlshortener.shortened, url: @urlshortener.url } }
    assert_redirected_to urlshortener_url(@urlshortener)
  end

  test "should destroy urlshortener" do
    assert_difference('Urlshortener.count', -1) do
      delete urlshortener_url(@urlshortener)
    end

    assert_redirected_to urlshorteners_url
  end
end
