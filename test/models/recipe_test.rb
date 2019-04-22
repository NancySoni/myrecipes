require 'test_helper'

class RecipeTest < ActiveSupport::TestCase


def setup
  @chef=Chef.create(chefname:"nancy",email:"nancy@example.com",password:"password",password_confirmation:"password")
@recipe=@chef.recipes.build(name:"vegetable",description:"great vegetable recipe")
end
# def setup
#
# @recipe=Recipe.new(name:"vegetable",description:"great vegetable recipe")
# end
test"recipe without chef is invalid"do
@recipe.chef_id=nil
assert_not @recipe.valid?

end
test "recipe should be valid" do
assert @recipe.valid?
end
test "name should be present" do
  @recipe.name=""
   assert_not @recipe.valid?
end
test "description should be present" do
  @recipe.description=""
   assert_not @recipe.valid?
end
test "description shouldn't be less than 5 character" do
  @recipe.description="a" * 3
  assert_not @recipe.valid?
end

test "description shouldn't be more than 500 character" do
@recipe.description="a"*501
assert_not @recipe.valid?

end
end
