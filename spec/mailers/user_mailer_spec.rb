require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { FactoryBot.create(:user) }  # Assumes you have a user factory set up
    let(:pdf_path) { Rails.root.join("spec", "support", "test.pdf") } # Assumes you have a test PDF in spec/support

    before do
      # If your Rails application is above 5.2, use the following line
      # Otherwise, use `ActionMailer::Base.deliveries.clear`
      ActionMailer::Base.deliveries = []
    end

    it "sends the welcome email to the user" do
      UserMailer.welcome_email(user, pdf_path).deliver_now
      
      # Check the email was sent
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      
      mail = ActionMailer::Base.deliveries.last

      # Validate the email content
      expect(mail.to).to include(user.email)
      expect(mail.subject).to eq("Welcome to My App")
      expect(mail.attachments.first.filename).to eq("booking_invoice.pdf")
    end
  end
end
