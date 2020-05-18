require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup infomation" do
		get new_user_path
		assert_no_difference 'User.count' do
			post users_path, params: {user: {name:'',email:'user@invalid',password:'yuya',password_confirmation:'yuy'}}
		end
		assert_template 'users/new'
	end

	test "valid singup infomation" do
		get new_user_path
		assert_difference 'User.count' do
			post users_path, params: {user: {name:'kosamoto',email:'saitama@wanpan.com',password:'saitama',password_confirmation:'saitama'}}
		end
		follow_redirect!
		assert_template 'users/show'
	end
end
