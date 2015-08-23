require 'rails_helper'

describe User do
  it "is invalid without a username" do
    expect(build(:valid_signup, username: nil)).to be_invalid
  end

  it "is invalid without a email" do
    expect(build(:valid_signup, email: nil)).to be_invalid
  end

  it "is invalid without a password" do
    expect(build(:valid_signup, password: nil)).to be_invalid
  end

  it "does not allow duplicate usernames" do
    create(:valid_signup, username: 'foodie')
    expect(build(:valid_signup, username: 'foodie')).to be_invalid
  end

  it "does not allow duplicate emails" do
    create(:valid_signup, email: 'jane.doe@cookery.com')
    expect(build(:valid_signup, email: 'jane.doe@cookery.com')).to be_invalid
  end

  it "persists downcased email and username" do
    user = attributes_for(:valid_signup)

  end

  it "returns a contact's full name as a string" do
    user = build(:valid_signup, username: "JohnDoe", email: "John.Doe@cookery.com")
    user.send(:downcase_attributes)
    expect(user.username).to eq('johndoe')
    expect(user.email).to eq('john.doe@cookery.com')
  end
end