class ConversationsController < ApplicationController
    before_action :authenticate_user!
    
    def show

        #Cerchiamo gli utenti della conversazione
        @other_user = User.find_by(email: params[:other_email])


        @conversation = Conversation.between(current_user.id, @other_user.id).first


        #se non c'è si crea, altrimenti si prende il record dal db
        if !@conversation 
            @conversation = Conversation.new
            @conversation.recipient_id = @other_user.id
            @conversation.sender_id = current_user.id
            @conversation.save
        end
        

        @messages = @conversation.messages

        session[:current_conversation] = @conversation.id

        

    end

    #Codice per la pagina delle chat
    def index
        @conversations = Conversation.where(" sender_id = " + current_user.id.to_s + " or recipient_id = " + current_user.id.to_s )
    end

    def delete_for_me
        @message = Message.find(params[:message])
        @message.update(deleted_for_user: true)
        if @message.deleted_for_both?
            @notification = Notification.find_by(params: {message: @message})
            @notification.destroy
            @message.destroy
        end
    end

    def delete_for_both
        ActionCable.server.broadcast("message_deletion_#{params[:conversation]}", message_id: params[:message])
        @message = Message.find(params[:message])
        @notification = Notification.find_by(params: {message: @message})
        @notification.destroy
        @message.destroy

    end

    def delete_for_recipient
        @message = Message.find(params[:message])
        @message.update(deleted_for_recipient: true)
        if @message.deleted_for_both?
            @notification = Notification.find_by(params: {message: @message})
            @notification.destroy
            @message.destroy
        end
    end

  
end
