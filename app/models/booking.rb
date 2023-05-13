class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :amount, :card_number, :exp_month, :exp_year, :cvc, :stripe_charge_id, :card_token

  def save_with_payment
    sanitize_card_number

    return false unless valid?
    charge = Stripe::Charge.create({
      amount: (amount.to_i * 100),
      currency: 'eur',
      source: 'tok_visa',
      description: "Prenotazione del post #{post.titolo} di #{post.user.name} da parte di #{user.name}",
      metadata: { user_id: user.id, post_id: post.id },
      application_fee_amount: (amount.to_i * 10)  # Imposta l'importo della commissione per la guida (10% dell'importo della prenotazione)
    }, {
      stripe_account: post.user.stripe_account_id  # Imposta l'ID dell'account collegato della guida come destinatario del pagamento
    })
    
    self.stripe_charge_id = charge.id
    save!
  rescue Stripe::CardError => e
    errors.add :base, e.message
    false
  end

  private

  def sanitize_card_number
    card_number.gsub!(/\s+/, "") if card_number.present?
  end
end


