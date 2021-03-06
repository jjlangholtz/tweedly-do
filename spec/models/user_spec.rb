require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:user, name: nil)).to be_invalid
  end

  it 'is invalid without an email' do
    expect(build(:user, email: nil)).to be_invalid
  end
end
