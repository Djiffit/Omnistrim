require 'rails_helper'
require 'helpers'

describe "opening streams" do
   it "twitch works" do
     visit '/twitch/lirik'
     expect(page).to have_css('iframe', src="http://player.twitch.tv/?channel=lirik")
     save_and_open_page
   end

  it "ustream works" do

  end

  it "azubu works" do

  end

  it "youtube works" do

  end
end
