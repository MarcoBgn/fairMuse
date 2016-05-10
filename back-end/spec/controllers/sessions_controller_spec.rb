require 'rails_helper'
require 'devise/test_helpers'
require 'sessions_helper'
RSpec.describe SessionsController, type: :controller do
  before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in nil
      @artist = User.create(name:"name", email:"email@email.com", password: 12345678, password_confirmation: 12345678)
      @listener = User.create(name:"name", email:"listener@email.com", password: 12345678, password_confirmation: 12345678)
      @artist.create_role(artist: true)
      @listener.create_role
  end

describe "POST #create" do
  context "with valid params" do
    it "allows artist login" do
      post :create, login
      token = User.find(@artist.id).authentication_token
      expected = {auth_token: token, user_id: 1, name: "name", is_subscriber: false, is_artist: true}.to_json
      expect(response.body).to eq expected
    end
    it "allows listener login" do
      post :create, login(email: "listener@email.com", artist: false)
      token = User.find(@listener.id).authentication_token
      expected = {auth_token: token, user_id: 2, name: "name", is_subscriber: false, is_artist: false}.to_json
      expect(response.body).to eq expected
    end
    end
    context "with invalid params"do
      it "does not allow artist login with invalid password" do
        post :create, login(password: 1)
        expected = {messages: "Sign In Failed: wrong password or incorrect login"}.to_json
        expect(response.body).to eq expected
      end
      it "does not allow artist login from listener panel"do
        post :create, login(artist: false)
        expected = {messages: "Sign In Failed: wrong password or incorrect login"}.to_json
        expect(response.body).to eq expected
      end
      it "does not allow listeners t login from artist panel"do
        post :create, login(email: "listener@email.com")
        expected = {messages: "Sign In Failed: wrong password or incorrect login"}.to_json
        expect(response.body).to eq expected
      end
    end
  end
end
