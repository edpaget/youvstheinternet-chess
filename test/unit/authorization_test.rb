require 'test_helper'

class AuthorizationTest < ActiveSupport::TestCase

  test "should not save authorization without provider or uid" do
    auth = Authorization.new
    assert !auth.save
    auth = Authorization.new( :provider => 'browser_id' )
    assert !auth.save
    auth = Authorization.new( :uid => "test@testmail.com" )
    assert !auth.save
  end

  test "should retrieve authorization with a hash containing provider and uid" do
    test_user = User.new
    auth_test = FactoryGirl.create(:authorization, :user => test_user)
    auth = Authorization.find_by_hash( { 'provider' => "browser_id", 'uid' => "one@testmail.com" } )
    assert_equal auth_test, auth
  end

  test "should create new auth from hash containing provider and uid" do
    test_user = User.new
    User.expects(:create_from_hash).returns(test_user)
    auth = Authorization.create_from_hash( { 'provider' => "browser_id", 'uid' => "three@testmail.com" } )
    assert auth
  end

end
