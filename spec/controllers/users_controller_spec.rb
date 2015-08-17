require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do

    context "with valid attributes" do
      it "creates a new user" do
        expect{ post :create, user: create(:valid_signup).attributes
        }.to change(User,:count).by(1)
      end

      it "redirects to the new contact" do
        post :create, user: attributes_for(:valid_signup)
        expect(response).to redirect_to User.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact" do
        expect{ post :create, user: attributes_for(:invalid_signup)
        }.to_not change(User,:count)
      end

      it "re-renders the new method" do
        post :create, user: attributes_for(:invalid_signup)
        expect(response).to redirect_to(signup_path)
      end
    end
  end

end
