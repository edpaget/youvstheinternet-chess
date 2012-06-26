require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should not save without an email" do
    user = User.new
    assert !user.save
  end

  test "should only create users from hash if it has a valid auth provider" do
    user = User.create_from_hash( { 'provider' => 'browser_id', 'uid' => "test@testmail.com" } )
    assert user

    user = User.create_from_hash( { 'provider' => 'facebook', 'uid' => "somecrazyletters" } )
    assert !user
  end

  test "should return all games that a user owns where the user has a moves to make" do
  end

end
