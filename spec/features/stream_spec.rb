require 'rails_helper'
require 'helpers'

describe "opening streams" do
  it "twitch works" do
    Stream.all.each do |s| s.destroy end
    visit '/twitch/lirik'
    expect(page).to have_css("#lirik")
  end

  it "ustream works" do
    visit '/ustream/nasa'
    expect(page).to have_css('#sidebar')
  end

  it "erroneous ustream gives error" do
    visit '/ustream/sjdkaopfadsk'
    expect(page).to have_content("Channel not found!")
  end

  it "azubu works" do
    visit '/societies'
    select "Azubu", :from => "provider"
    fill_in('name', with:'EPGTV')
    click_button('Go!')
    expect(page).to have_css('#EPGTV')
  end

  it "youtube works" do
    visit '/youtube/wyK7YuwUWsU'
    expect(page).to have_css('#wyK7YuwUWsU')
  end

  it "search bar works with results found" do
    visit '/societies'
    fill_in('name', with:'dota')
    click_button('Go!')
    expect(page).to have_content('playing Dota 2 for')
  end

  it "search bar works with no results found" do
    visit '/societies'
    fill_in('name', with:'dotgdfsgdsfgdsfgsdfgsdgsdfgsdfgdsfgdsvgcvgsdfgcvgsdfgcdvgdsfgdfa')
    click_button('Go!')
    expect(page).to have_content('Your search found no live streams')
  end

  it "displays several youtubevideos from a channel" do
    visit '/channel/view/UCbx1TZgxfIauUZyPuBzEwZg'
    expect(page).to have_content("Stellaris:")
  end
end
