class ConversationsController < ApplicationController
    before_action :authenticate_user!
    include Devise::Controllers::Helpers
    def show
        #Controlliamo se tale conversazione già esiste
        if session[:current_conversation]
            @conversation = Conversation.find(session[:current_conversation])
        end
        #Cerchiamo gli utenti della conversazione
        @current_user = current_user
        @guide_user = User.find_by(email: params[:guide_email])

        if !@conversation 
            @conversation = Conversation.between(@current_user.id,@guide_user.id).first
        end

        #se non c'è si crea, altrimenti si prende il record dal db
        if !@conversation
            @conversation = Conversation.new
            @conversation.recipient_id = @guide_user.id
            @conversation.sender_id = current_user.id
            @conversation.save
        end
        

        @messages = @conversation.messages

        session[:current_conversation] = @conversation.id

        

    end

    def delete_for_me
        @message = Message.find(params[:message])
        @message.update(deleted_for_user: true)
        if @message.deleted_for_both?
            @message.destroy
        end
    end

    def delete_for_both
        ActionCable.server.broadcast("message_deletion_#{params[:conversation]}", message_id: params[:message])
        @message = Message.find(params[:message])
        @message.destroy
    end

    def delete_for_recipient
        @message = Message.find(params[:message])
        @message.update(deleted_for_recipient: true)
        if @message.deleted_for_both?
            @message.destroy
        end
    end

  
end
