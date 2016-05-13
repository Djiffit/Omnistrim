require 'rails_helper'
require 'helpers'

describe "homepage" do
  FactoryGirl.create(:user)
  describe "as a non-registered user" do
    it "loads main page" do
      visit '/'
      expect(page).to have_content("viewers")
    end
  end

  describe "as a user with twitch authentication" do
    before :each do
      sign_in(username:"Pekka", password:"pekka")
    end
    it "loads main page" do
      visit '/'
      expect(page).to have_link("Pekka")
      expect(page).to have_content("Show Twitch")
    end
  end

  describe "as a user with youtube authentication" do

    it "loads main page correctly" do
      FactoryGirl.create(:user2)
      sign_in(username:"Pekkaa", password:"pekka")
      visit '/'
      expect(page).to have_content("Show Youtube")
    end
  end

  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end
end
