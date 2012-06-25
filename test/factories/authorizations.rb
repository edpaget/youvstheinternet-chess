FactoryGirl.define do
  factory :authorization do |auth|
    auth.provider "browser_id"
    auth.uid "one@testmail.com"
  end
end
