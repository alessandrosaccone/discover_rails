module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    include Devise::Controllers::Helpers

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        # or however you want to verify the user on your system
        client_id = request.params[:client]
        verified_user = User.find_by(email: client_id)
        if verified_user = env['warden'].user
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
