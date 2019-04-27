require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname:"nancy",email:"nancy@example.com",password:"password",password_confirmation:"password")

  end
  test "should reject invalid edit" do
    sign_in_as(@chef,"password")
       get edit_chef_path(@chef)
        assert_template 'chefs/edit'
       patch chef_path(@chef),params:{chef:{chefname:"",email:""}}
  assert_template 'chefs/edit'
  assert_select 'h2.panel-title'
  assert_select 'div.panel-body'

  end
  test "should accept valid update" do
    sign_in_as(@chef,"password")
    get edit_chef_path(@chef)
     assert_template 'chefs/edit'
    patch chef_path(@chef),params:{chef:{chefname:"gulati",email:"gulati@example.com"}}
assert_redirected_to @chef
assert_not flash.empty?
@chef.reload
assert_match "gulati",@chef.chefname
assert_match "gulati@example.com",@chef.email
  end
end
