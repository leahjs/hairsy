require 'rails_helper'

describe "Update User Email", :type => :feature do
    before :each do
      @user = create(:valid_signup)
    end

  it "allows user to update email" do
    visit signin_path
    fill_in "Email", :with => @user.attributes['email']
    fill_in "Password", :with => 'abc123'
    click_button 'Sign In'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit edit_user_path(@user)

    fill_in "current_user[email]", :with => "mynewemail@lookbook.com"
    fill_in "Password", :with => "abc123"
    click_button 'Update Email'

    expect(@user.attributes['email']).to eq('mynewemail@lookbook.com')
  end

end
