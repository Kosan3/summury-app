require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name:'YuyaKosaka', email:'yuya@kosaka.com',
  		password:'ichiro', password_confirmation: 'ichiro')
  end

  test 'should be valid?' do
  	assert @user.valid?
  end

  test 'name should be present' do
  	@user.name = ''
  	assert_not @user.valid?
  end

  test 'email should be present' do
  	@user.email = ''
  	assert_not @user.valid?
  end

  test 'name should not be too long' do
  	@user.name = 'y' * 51
  	assert_not @user.valid?
  end

  test 'email should not be too long' do
  	@user.email = 'y' * 256
  	assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
  	addresses = %w[user@docomo.com USER@docomo.COM US-ER@do.co.com]
  	addresses.each do |address|
  		@user.email = address
  		assert @user.valid?, "#{address.inspect} がエラーです"
  	end
  end

  test 'email validation should reject invalid addresses' do
  	addresses = %w[user@docomo,com user_docomo_com user@docomo user@docomo+com]
  	addresses.each do |address|
  		@user.email = address
  		assert_not @user.valid?, "#{address.inspect} がエラーです"
  	end
  end

  test 'email addresses should be unique' do
  	duplicate_user = @user.dup
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
  	@user.password = '' * 6
  	@user.password_confirmation = '' * 6
  	assert_not @user.valid?
  end

  test "passoword should have a minimum length" do
  	@user.password = 'y' * 5
  	@user.password_confirmation = 'y' * 5
  	assert_not @user.valid?
  end
end
