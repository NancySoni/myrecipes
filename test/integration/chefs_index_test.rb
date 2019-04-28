require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname:"nancy",email:"nancy@example.com",password:"password",password_confirmation:"password")
      @chef2=Chef.create!(chefname:"sim",email:"sim@example.com",password:"simsim",password_confirmation:"simsim")
      @admin_user=Chef.create!(chefname:"sim1",email:"sim1@example.com",password:"simsim",password_confirmation:"simsim",admin:"true")
  end

  test "should get chef index" do
    get chefs_path
    assert_response:success
  end
test "should get chef listing" do
  get chefs_path
  assert_template 'chefs/index'
  assert_select "a[href=?]",chef_path(@chef),text:@chef.chefname.capitalize
  assert_select "a[href=?]",chef_path(@chef2),text:@chef2.chefname.capitalize

end





test"should delete chef"do
sign_in_as(@admin_user,"simsim")
    get chefs_path
  assert_template 'chefs/index'
  assert_difference 'Chef.count',-1 do
    delete chef_path(@chef2)
  end
  assert_redirected_to chefs_path
  assert_not flash.empty?
end
end