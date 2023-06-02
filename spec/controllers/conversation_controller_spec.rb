require 'rails_helper'
  RSpec.describe ConversationsController, type: :controller do
  include Devise::Test::ControllerHelpers

    let(:user) { FactoryBot.build(:user) }
    let(:guide) { FactoryBot.build(:guide) }
    let(:conversation)  {FactoryBot.build(:conversation, sender_id: user.id, recipient_id: guide.id)}
   
    before do
      sign_in user
    end
  
    describe "GET #show" do
      it "assigns the conversation and messages" do
        ActiveRecord::Base.connection.disable_referential_integrity do
          conversation.save(validate: false)
        end
        session[:current_conversation] = conversation.id
        if conversation.save
          get :show, params: { guide_email: guide.email }
    
          expect(assigns(:conversation)).to eq(conversation)
          expect(assigns(:messages)).to eq(conversation.messages)
        end
      end
    end
  

  end