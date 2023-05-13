class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :amount, :card_number, :exp_month, :exp_year, :cvc
  def refund_payment
    return false unless stripe_charge_id.present?

    refund = Stripe::Refund.create(
      charge: stripe_charge_id,
      reverse_transfer: true
    )

    # Aggiorna lo stato della prenotazione o esegui altre operazioni necessarie
    # ad esempio, segna la prenotazione come rimborsata nel database
    update(refunded: true)

  rescue Stripe::StripeError => e
    # Gestisci eventuali errori nell'elaborazione del rimborso
    errors.add :base, e.message
    false
  end

  def save_with_payment
    sanitize_card_number

    return false unless valid?

    token = Stripe::Token.create(
      card: {
        number: card_number,
        exp_month: exp_month,
        exp_year: exp_year,
        cvc: cvc
      }
    )
    #Non so come indirizzare le application fee
    charge = Stripe::Charge.create(
      {
        amount: (amount.to_i * 100),
        currency: 'eur',
        source: token.id,
        description: "Prenotazione del post #{post.titolo} di #{post.user.name} da parte di #{user.name}",
        metadata: { user_id: user.id, post_id: post.id },
        application_fee_amount: (amount.to_i * 7) # Imposta l'importo della commissione per la guida (10% dell'importo della prenotazione)
      },
      stripe_account: post.user.stripe_account_id # Imposta l'ID dell'account collegato della guida come destinatario del pagamento
    )

    self.stripe_charge_id = charge.id
    save!
  rescue Stripe::CardError => e
    puts "Stripe::CardError - Code: #{e.code}" # Stampa il valore del codice di errore
    case e.code
    when 'card_declined'
      errors.add :base, "La carta di credito è stata rifiutata. Assicurati che le informazioni siano corrette e riprova."
    when 'expired_card'
      errors.add :base, "La carta di credito è scaduta. Si prega di utilizzare una carta valida."
    when 'invalid_expiry_year'
      errors.add :base, "L'anno di scadenza della carta di credito non è valido. Assicurati di inserire un anno valido."
    when 'invalid_expiry_month'
      errors.add :base, "Il mese di scadenza della carta di credito non è valido. Assicurati di inserire un mese valido."
    else
      errors.add :base, "Errore durante l'elaborazione della carta di credito. Si prega di riprovare più tardi."
    end
    false

  end
  
  

  private

  def sanitize_card_number
    card_number.gsub!(/\s+/, "") if card_number.present?
  end
end



