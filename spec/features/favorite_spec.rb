require 'rails_helper'
require 'helpers'

describe "favorite functionality" do
  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end

  before :each do
    sign_in(username: "Pekkaa", password: "pekka")
  end

  it "adds a favorite when favorite button is pressed" do
    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    visit user_path(1)
    expect(page).to have_css("a#MANvsGAME")
  end

  it "removes favorite when pressing remove button" do
    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    visit user_path(1)
    expect(page).to have_css("a#MANvsGAME")
    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    visit user_path(1)
    expect(page).not_to have_css("a#MANvsGAME")

  end

end
