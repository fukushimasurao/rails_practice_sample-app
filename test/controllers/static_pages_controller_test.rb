require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  # setupという特別なメソッド（各テストが実行される直前で実行されるメソッド）
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    # getメソッドで、 'static_pages/home'にアクセスしたときに、200が帰ってくるか。
    # static_pages_home_urlはrouting を作成したときに、勝手に作られる。
    get static_pages_home_url
    assert_response :success
    
    # HTMLのタイトルに、想定するタイトルがあるか確認する。
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
