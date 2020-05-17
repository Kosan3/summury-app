require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@base = '埼玉県民'
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
