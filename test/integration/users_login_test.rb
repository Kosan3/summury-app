require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:yuya)
	end

	test 'after login should lost falsh meassage' do
		get login_path
		assert_template 'sessions/new'
		post login_path, params:{session:{name:'uyy',password:''}}
		assert_template 'sessions/new'
		assert flash.any?
		get root_path
		assert flash.empty?
	end

	test 'login with valid infomation' do
		get login_path
		post login_path, params:{session:{name:@user.name,password:'password'}}
		assert_redirected_to @user
		follow_redirect!
		assert_template 'users/show'
		assert_select 'a[href=?]', login_path, count: 0
		assert_select 'a[href=?]', logout_path
		assert_select 'a[href=?]', user_path(@user)
		assert_select 'a[href=?]', users_path
	end

	test 'login with valid name invalid password' do
		get login_path
		assert_template 'sessions/new'
		post login_path, params:{session:{name:@user.name,password:'invalid'}}
		assert_not is_logged_in?
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	test 'login after logout' do
		get login_path
		assert_template 'sessions/new'
		post login_path, params:{session:{name:@user.name,password:'password'}}
		assert is_logged_in?
		assert_redirected_to user_path(@user)
		follow_redirect!
		assert_template 'users/show'
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_path
	end
end
