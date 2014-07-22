require 'rails_helper'

describe Todo do
  it 'has a valid factory' do
    expect(create(:todo)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:todo, title: nil)).to be_invalid
  end
end
