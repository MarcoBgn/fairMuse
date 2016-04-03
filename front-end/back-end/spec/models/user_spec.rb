require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){described_class.new}
  
  it { is_expected.to have_many :streams }

  it "generates an authentication token" do
    allow(user).to receive(:email).and_return 'dave@gmail.com'
    allow(user).to receive(:password).and_return 'password'
    allow(Devise).to receive(:friendly_token).and_return :token
    expect(user.ensure_authentication_token).to eq "token"
  end
end