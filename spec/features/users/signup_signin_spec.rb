require 'rails_helper'

describe "SignIn/SignUp Account Process", :type => :feature do
  context 'Sign Up' do
    before :each do
      @user = create(:valid_signup)
    end

    it "allows signup  with required fields" do
      visit signup_path
      fill_in 'Username', :with => @user.attributes['username']
      fill_in 'Email', :with => @user.attributes['email']
      fill_in 'Password', :with => 'abc123'
      click_button 'Sign Up'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_path(@user)
      # expect(page).to have_content 'The User Show Page'
      expect(page).to have_content @user.attributes['email']
    end

    it "does not allow signup with missing fields" do
      visit signup_path
      fill_in 'Username', :with => nil
      fill_in 'Email', :with => @user.attributes['email']
      fill_in 'Password', :with => 'abc123'
      click_button 'Sign Up'
      expect(page).to have_content 'Sign Up'

    end

    it 'allows signin' do
      visit signin_path
      fill_in "Email", :with => @user.attributes['email']
      fill_in "Password", :with => 'abc123'
      click_button 'Sign In'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit user_path(@user)

      expect(page).to have_content @user.attributes['email']
    end
  end

end
