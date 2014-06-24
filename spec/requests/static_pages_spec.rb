require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do

  describe "Static pages" do

    describe "Home page" do

      it "should have the content 'Tweedly Do'" do
        visit '/'
        expect(page).to have_content('Login')
      end
    end
  end
end
