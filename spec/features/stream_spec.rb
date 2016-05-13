require 'rails_helper'
require 'helpers'

describe "opening streams" do
  it "twitch works" do
    visit '/twitch/lirik'
    expect(page).to have_css("#lirik")
  end

  it "ustream works" do
    visit '/ustream/nasa'
    expect(page).to have_css('#sidebar')
  end

  it "azubu works" do
    visit '/azubu/EPGTV'
    expect(page).to have_css('#EPGTV')
  end

  it "youtube works" do
    visit '/youtube/wyK7YuwUWsU'
    expect(page).to have_css('#wyK7YuwUWsU')
  end
end
