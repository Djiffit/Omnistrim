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
    User.all.each do |s| s.destroy end
    user = FactoryGirl.create(:user)
    sign_in(username: "Pekka", password: "pekka")
    visit '/twitch/MANvsGAME'
    save_and_open_page
    click_button('Favorite')
    visit user_path(user)
    expect(page).to have_css("a#MANvsGAME")
  end

  it "removes favorite when pressing remove button" do
    User.all.each do |s| s.destroy end
    user = FactoryGirl.create(:user)
    visit societies_path
    sign_in(username: "Pekka", password: "pekka")
    visit '/twitch/MANvsGAME'
    click_button('Favorite')
    click_button('Favorite')
    visit user_path(user)
    expect(page).not_to have_css("a#MANvsGAME")
  end

  it "adds twitch follows as favorites" do
    User.all.each do |s| s.destroy end
    user = FactoryGirl.create(:user)
    visit societies_path
    sign_in(username: "Pekka", password: "pekka")
    visit '/twitch/add'
    visit user_path(user)
  end

end
