require 'rails_helper'
describe MessagesController do
  context 'when a message is created' do
    it 'it is added to a database succesfully' do
      post :create, :message => {content: 'lolsdfaop', user_id: FactoryGirl.create(:user).id}, remote: true
      expect(Message.count).to be(1)
      expect(Message.last.content).to eq('lolsdfaop')
    end

  end

  context 'when a personal message is created' do
    it 'it is directed to the correct person' do
      post :create, :message => {content: '/w Pekka lolsdfaop', user_id: FactoryGirl.create(:user).id}, remote: true
      expect(Message.count).to be(1)
      expect(Message.last.content).to eq(' lolsdfaop')
      expect(Message.last.target_name).to eq('Pekka')
    end
  end
end