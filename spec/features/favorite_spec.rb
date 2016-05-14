require 'rails_helper'
require 'helpers'

describe "favorite functionality" do
  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end

  it "adds a favorite when favorite button is pressed" do
    sign_in(username: "Pekka", password: "pekka")
    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    visit user_path(1)
    save_and_open_page
    expect(page).to have_css("a#MANvsGAME")
  end

  it "removes favorite when pressing remove button" do
    visit societies_path

    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    visit user_path(1)
    expect(page).not_to have_css("a#MANvsGAME")

  end

end
