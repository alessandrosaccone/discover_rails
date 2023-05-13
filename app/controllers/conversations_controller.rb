class ConversationsController < ApplicationController
    before_action :authenticate_user!
    def show
        #Cerchiamo gli utenti della conversazione
        @current_user = current_user
        @guide_user = params[:guide_user]

        #Controlliamo se tale conversazione già esiste
        @conversation = Conversation.join(:participants).where(
            participants: { user_id: [@current_user.id, @guide_user.id]}
        ).group("conversations.id").having("count(*) = 2").first_or_initialize
        
        #mettiamo i partecipanti nel db se non ci sono già
        if conversation.new_record?
            conversation.save
            [@current_user.id, @guide_user.id].each do |user|
                conversation.participants.create(user: user)
            end
        end

        @messages = conversation.messages

    end
end
