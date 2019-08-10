require 'test_helper'
class IngredientTest <ActiveSupport::TestCase
  def setup
    @ingredient=Ingredient.create!(name: "cookies")
  end
  test "ingredient should be present" do
    @ingredient.name=""
    assert_not @ingredient.valid?
  end
test "ingredient should not be less than 2 character" do
    @ingredient.name="q"
assert_not @ingredient.valid?
end


test "ingredient should  be maximum 25 character" do
@ingredient.name="q"*30
assert_not @ingredient.valid?
end
end
