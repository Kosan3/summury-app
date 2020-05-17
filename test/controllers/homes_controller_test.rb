require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@base = 'SAITAMA'
  end

  test "should get top" do
    get root_path
    assert_response :success
    assert_select 'title', "HOME | #{@base}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select 'title', "ABOUT | #{@base}"
  end

  test 'should get help' do
  	get help_path
  	assert_response :success
  	assert_select 'title', "HELP | #{@base}"
  end

end
