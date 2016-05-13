FactoryGirl.define do

  factory :user do
    name "Pekka"
    password "pekka"
    password_confirmation "pekka"
    twitch "x25aqut4a4n1b4241y4wclrwx80vr0"
    twitchname "antoisaamaanantaita"
  end

  factory :stream do
    name "MANvsGAME"
    provider "twitch"
    icon "https://static-cdn.jtvnw.net/jtv_user_pictures/manvsgame-profile_image-d1498cdeb68ca549-300x300.png"
  end

  factory :favorite do
    user_id FactoryGirl.create(:user).id
    stream_id FactoryGirl.create(:stream).id
  end

  factory :society do
    name "Pekkamies"
    abbreviation "pem"
    description "lol kek top kek toppest of kek veri fun actyaly"
    user_id FactoryGirl.create(:user).id
    stream_id FactoryGirl.create(:stream).id
  end

  factory :membership do
    user_id FactoryGirl.create(:user).id
    society_id FactoryGirl.create(:society).id

  end

  factory :message do
    content "Very fun actyalu god joke"
    user_id FactoryGirl.create(:user).id

    
  end

end