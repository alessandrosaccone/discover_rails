class ConversationsController < ApplicationController
    before_action :authenticate_user!
    def show
        #Controlliamo se tale conversazione già esiste
        @conversation = Conversation.find(session[:current_conversation])
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
end
