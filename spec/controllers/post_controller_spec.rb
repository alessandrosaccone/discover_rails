require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#get_price' do
    let(:post) { FactoryBot.build(:post) }
    let(:params) { { id: post.id, persone: 3 } }

    context 'when price calculation is successful' do
      before do
        ActiveRecord::Base.connection.disable_referential_integrity do
          post.save(validate: false)
        end
        allow(Post).to receive(:find).and_return(post)
        allow(post).to receive(:prezzo).and_return(10)
        allow(post).to receive(:numero_ore).and_return(2)
        allow(post).to receive(:persone).and_return(5)
      end

      it 'returns the calculated price' do
        get :get_price, params: params

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ 'price' => 12 })
      end
    end

    context 'when number of people is zero or negative' do
      before do
        allow(Post).to receive(:find).and_return(post)
      end
      let(:params) { { id: post.id, persone: -1 } }

      it 'returns an error response' do
        get :get_price, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Inserisci un numero positivo di persone' })
      end
    end

    context 'when number of people exceeds available limit' do
      before do
        allow(Post).to receive(:find).and_return(post)
        allow(post).to receive(:persone_rimanenti).and_return(2)
      end

      let(:params) { { id: post.id, persone: 3 } }

      it 'returns an error response' do
        get :get_price, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Inserisci un numero entro il limite di persone' })
      end
    end
  end

  describe '#get_price' do
    let(:post) { double('Post', prezzo: 10, numero_ore: 2, persone: 5, persone_rimanenti: 5) }
    let(:params) { { id: 1, persone: 3 } }

    before do
      allow(Post).to receive(:find).and_return(post)
    end

    context 'when the price calculation is successful' do
      it 'returns the calculated price' do
        get :get_price, params: params

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ 'price' => 12 })
      end
    end

    context 'when the number of people is zero or negative' do
      let(:params) { { id: 1, persone: -1 } }

      it 'returns an error response' do
        get :get_price, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Inserisci un numero positivo di persone' })
      end
    end

    context 'when the number of people exceeds the available limit' do
      let(:params) { { id: 1, persone: 3 } }

      before do
        allow(post).to receive(:persone_rimanenti).and_return(2)
      end

      it 'returns an error response' do
        get :get_price, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Inserisci un numero entro il limite di persone' })
      end
    end
  end

  describe '#all' do
    let(:posts) { [double('Post')] }

    before do
      allow(Post).to receive(:all).and_return(posts)
    end

    it 'returns all posts as JSON' do
      get :all

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(posts.to_json)
    end
  end

end
