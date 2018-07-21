require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do
		get signup_path

		assert_no_difference 'User.count' do
			post signup_path, params: { user: { name: "alexander", email:"alexanderalexander.alexander", password: "alexander", password_confirmation: "alexander" }}
		end

		assert_template 'shared/_error_messages'
#		assert_select 'form[action="/signup"]'
#		assert_select 'div#error_explanation'
#		assert_select 'div.alert alert-danger'

	end

	test "valid signup information" do
		get signup_path

		assert_difference 'User.count', 1 do
			post signup_path, params: { user: { name: "alexander", email:"alexander@alexander.alexander", password: "alexander", password_confirmation: "alexander" }}
		end

		follow_redirect!
		assert_template 'users/show'
		assert is_logged_in?
#		assert_not flash.empty?
#		assert_select 'div#error_explanation'
#		assert_select 'div.alert alert-danger'

	end

end
