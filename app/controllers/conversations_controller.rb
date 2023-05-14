class ConversationsController < ApplicationController
    before_action :authenticate_user!
    def show
        #Cerchiamo gli utenti della conversazione
        @current_user = current_user
        @guide_user = User.find_by(email: params[:guide_email])


        #Controlliamo se tale conversazione già esiste
        @participant = Participant.joins("JOIN participants as p2 on p2.conversation_id = participants.conversation_id").where(
            :participants => {:user_id => current_user.id}).where(
            :p2 => {:user_id => @guide_user.id}
            ).first

        #se non c'è si crea, altrimenti si prende il record dal db
        if !@participant
            @conversation = Conversation.new
        else
            @conversation = Conversation.find(@participant.conversation_id)
        end
        
        
        #mettiamo i partecipanti nel db se non ci sono già
        if @conversation.new_record?
            @conversation.save
            [@current_user.id, @guide_user.id].each do |user|
                @conversation.participants.create(user_id: user)
            end
        end

        @messages = @conversation.messages

        

    end
end
