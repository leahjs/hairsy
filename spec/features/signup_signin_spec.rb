require 'rails_helper'

describe "SignIn/SignUp Account Process", :type => :feature do
  context 'Sign Up' do
    before :each do
      @user = create(:valid_signup)
    end

    xit "allows signup  with required fields" do
      visit signup_path
      fill_in 'Username', :with => @user.attributes['username']
      fill_in 'Email', :with => @user.attributes['email']
      fill_in 'Password', :with => 'abc123'

      click_button 'Sign Up'
      expect(page).to have_content 'The User Show Page'
    end

    it "does not allow signup with missing fields" do
      visit signup_path
      fill_in 'Username', :with => nil
      fill_in 'Email', :with => @user.attributes['email']
      fill_in 'Password', :with => 'abc123'

      click_button 'Sign Up'
      expect(page).to have_content 'Sign Up'
    end

    xit 'allows signin' do
      visit signin_path
      fill_in "Email", :with => @user.attributes['email']
      fill_in "Password", :with => 'abc123'
      click_button 'Sign In'

      # visit user_path(@user)
      
      expect(page).to have_content 'The User Show Page'
    end
  end

end
