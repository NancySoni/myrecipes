require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
def setup
  @chef=Chef.create!(chefname:"nancy",email:"nancy@example.com")
  @recipe=Recipe.create(name:"vegetable saute",description:"greate vegetable saute",chef:@chef)
  @recipe2=@chef.recipes.build(name:"chicken saute",description:"greate chicken dish")
  @recipe2.save

end
test"should get recipe index"do
get recipes_path
assert_response:success

end

test "should get recipe listing" do
get recipes_path
assert_template 'recipes/index'
assert_match @recipe.name,response.body
assert_match @recipe2.name,response.body
end




  # test "the truth" do
  #   assert true
  # end
end
