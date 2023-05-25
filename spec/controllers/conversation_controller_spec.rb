require 'rails_helper'



  RSpec.describe ConversationsController, type: :controller do
  include Devise::Test::ControllerHelpers

    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:guide) { FactoryBot.build_stubbed(:guide) }
   
    before do
      sign_in user
    end
  
    describe "GET #show" do
      it "assigns the conversation and messages" do
        conversation = FactoryBot.create(:conversation, sender_id: user.id, recipient_id: guide.id)
        session[:current_conversation] = conversation.id
        puts user.id
        puts guide.id
        if conversation.save
          get :show, params: { guide_email: guide.email }
    
          expect(assigns(:conversation)).to eq(conversation)
          expect(assigns(:messages)).to eq(conversation.messages)
        else
          puts conversation.errors.full_messages
        end
      end
  
      it "creates a new conversation if none exists" do
        get :show, params: { guide_email: guide.email }
  
        expect(assigns(:conversation)).to be_a(Conversation)
        expect(assigns(:conversation).sender_id).to eq(user.id)
        expect(assigns(:conversation).recipient_id).to eq(guide.id)
      end
    end
  
    # Add more tests for other controller actions...
  end
  