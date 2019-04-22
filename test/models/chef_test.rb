require 'test_helper'
class ChefRecipe < ActiveSupport::TestCase
  def setup
    @chef=Chef.new(chefname:"nancy", email:"nancy@example.com",password:"password",password_confirmation:"password")
  end
  test "should be valid" do
    assert @chef.valid?
  end
test"name should be present"do
@chef.chefname=""
assert_not @chef.valid?
end
test"email should be present"do
@chef.email=""
assert_not @chef.valid?
end
test"name shouln't be more than 30 charactes"do
@chef.chefname="a"*31
assert_not @chef.valid?
end
test "email shouln't be too long"do
  @chef.email="a" * 245 + "@example.com"
  assert_not @chef.valid?
end
test "email should be correct format"do
  valid_emails= %w[user@example.com nancy@gmail.com m.first@yahoo.ca john+smith@co.uk.org]
  valid_emails.each do |valids|
  @chef.email= valids
  assert @chef.valid?, "#{valids.inspect}should be valid"
end
end
test"shouls reject invalid email address"do
invalid_email=%w[nancy@gmail nancy@gmail,com nancy.fsf.gmail jor@bar+foo.com]
invalid_email.each do|invalids|
  @chef.email=invalids
  assert_not @chef.valid?,"#{invalids.inspect}should be invalid"
end
end
test"email should be unique and case insensitive"do
duplicate_chef= @chef.dup
duplicate_chef.email=@chef.email.upcase
@chef.save
assert_not duplicate_chef.valid?
end
test "email should be lower case brfore hitting datavase"do
  mixed_email="JoJn@Example.com"
  @chef.email=mixed_email
  @chef.save
  assert_equal mixed_email.downcase,@chef.reload.email
end
test "password should be present"do
@chef.password=@chef.password_confirmation=" "
assert_not @chef.valid?
end
test"password should be minimum 5 character"do
@chef.password=@chef.password_confirmation="a "*2
assert_not @chef.valid?

end
end
