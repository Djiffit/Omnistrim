FactoryGirl.define do

  factory :user do
    name "Pekka"
    password "pekka"
    password_confirmation "pekka"
    twitch "awyaexgdl0g9ot0cjn5cby63j39q95"
    twitchname "antoisaamaanantaita"
  end

  factory :user2, class: User do
    name "Pekkaa"
    password "pekka"
    password_confirmation "pekka"
    youtubetoken "1/Pon3RV0NDBklNtbVZ4nHpreMdm6WkUhE2GeZ6-3dWAAMEudVrK5jSpoR30zcRFq6"
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


  factory :message do
    content "Very fun actyalu god joke"
    user_id FactoryGirl.create(:user).id

  end

end