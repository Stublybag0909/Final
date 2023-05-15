require "test_helper"

class MenuPagesControllerTest < ActionDispatch::IntegrationTest  
    test "should get home" do
      get menu_pages_home_url
      assert_response :success
      assert_select "title"
    end

    test "should get help" do
      get menu_pages_help_url
      assert_response :success
      assert_select "title"
    end
end
