require 'rails_helper'
require 'devise/test_helpers'
RSpec.describe RegistrationsController, type: :controller do
  before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in nil
  end

  let(:valid_attributes){
    {name: "name",
    email: "email@email.com",
    password: 12345678,
    password_confirmation: 12345678}
  }
  let(:invalid_attributes){{
    name: "name",
    email: "a",
    password: 1,
    password_confirmation: 2
  }}

describe "POST #create" do
  context "with valid params" do
    it "creates a new User" do
      expect {
        post :create, valid_attributes
      }.to change(User, :count).by(1)
    end
    it "creates a new Role"do
      expect {
        post :create, valid_attributes
      }.to change(Role, :count).by(1)
    end
  end

  context "with invalid params" do
    it "does not create a new User" do
      expect {
        post :create, invalid_attributes
      }.to change(User, :count).by(0)
    end
  end
end
end
