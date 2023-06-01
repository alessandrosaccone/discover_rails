require 'rails_helper'

RSpec.describe EmailController, type: :controller do
  describe 'POST #send_email' do
    it 'sends an email with the generated invoice PDF' do
      booking = FactoryBot.build_stubbed(:booking)
      unless booking.valid?
        puts booking.errors.full_messages.join(", ")
      end
      
      allow(Booking).to receive(:find).with(booking.id.to_s).and_return(booking)
      
      pdf = 'path/to/invoice.pdf' # Path to a sample PDF for testing
      allow(booking).to receive(:generate_invoice_pdf).and_return(pdf)
      
      user = FactoryBot.build_stubbed(:user) # Assuming you have a user factory set up with FactoryBot
      allow(controller).to receive(:current_user).and_return(user)
      
      mailer = double('UserMailer')
      expect(UserMailer).to receive(:welcome_email).with(user, pdf).and_return(mailer)
      expect(mailer).to receive(:deliver)
      
      post :send_email, params: { booking: booking.id } 
      
      expect(response).to be_successful
    end
  end
end
