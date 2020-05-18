require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'links' do
  	get root_path
  	assert_template 'homes/top'
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", about_path
  	assert_select 'title', full_title('HOME')
  end
end
