require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get team" do
    get static_pages_team_url
    assert_response :success
  end

  test "should get workshops" do
    get static_pages_workshops_url
    assert_response :success
  end

  test "should get gallery" do
    get static_pages_gallery_url
    assert_response :success
  end

  test "should get projects" do
    get static_pages_projects_url
    assert_response :success
  end

end
