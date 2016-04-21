require 'rails_helper'

RSpec.describe Role, type: :model do

  it { is_expected.to belong_to :user }
end
