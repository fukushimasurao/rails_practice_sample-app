require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  # setupという特別なメソッド（各テストが実行される直前で実行されるメソッド）
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  # test "should get root" do
  #   get root_url
  #   assert_response :success
  # end

  test "should get home" do
    # getメソッドで、 'static_pages/home'にアクセスしたときに、200が帰ってくるか。
    # static_pages_home_urlはrouting を作成したときに、勝手に作られる。
    get root_path
    assert_response :success
    
    # HTMLのタイトルに、想定するタイトルがあるか確認する。
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
