require 'rails_helper'
require 'devise/test_helpers'
RSpec.describe SessionsController, type: :controller do
  before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in nil
      user = User.create(name:"name", email:"email@email.com", password: 12345678, password_confirmation: 12345678)
      @role = user.create_role
  end
  let(:valid_attributes){{
    email: "email@email.com",
    password: 12345678
  }}
  let(:invalid_attributes){{
    email: "email@email.com",
    password: 1
  }}

describe "POST #create" do
  context "with valid params" do
    it "allows login" do
        post :create, valid_attributes
        token = User.last.authentication_token
        expected = {auth_token: token, user_id: 1, name: "name", is_subscriber: false, is_artist: false}.to_json
        response.body.should == expected
      end
    end
    context "with invalid params"do
      it "does not allow login"do
        post :create, invalid_attributes
        expect(response).to render_template(nil)
      end
    end
  end
end
