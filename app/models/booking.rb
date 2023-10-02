class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  after_create :generate_invoice_pdf

  attr_accessor  :card_number, :exp_month, :exp_year, :cvc,:name

  def refundable?
    # Verifica le condizioni che rendono la prenotazione rimborsabile
    # Ad esempio, potresti controllare se la prenotazione non è già stata cancellata o se la data di inizio è nel futuro
    # Puoi personalizzare le condizioni in base alle tue esigenze

    # Esempio: La prenotazione può essere rimborsata solo se non è già stata cancellata
    if self.refunded==true
      return false
    else
      if self.expired==true
        return false
      else
        return true
      end
    end
  end
  def refund_payment
    return false unless stripe_charge_id.present?
  
    charge = Stripe::Charge.retrieve(stripe_charge_id, { stripe_account: 'acct_1N6vy0A60U57XjZB'})
    
    if charge
      puts charge
      refund = Stripe::Refund.create({
        charge: charge.id,},
        stripe_account: 'acct_1N6vy0A60U57XjZB'
      )
      
      update(refunded: true)
      
    else
      errors.add :base, "The charge was not found in the Connect account."
      return false
    end
  rescue Stripe::StripeError => e
    errors.add :base, e.message
    false
  end
  
  
  def generate_invoice_pdf
    template = ERB.new(File.read("#{Rails.root}/app/views/invoices/invoice.html.erb"))
    result = template.result_with_hash(booking: self)
    pdf = WickedPdf.new.pdf_from_string(result)

    # Salva il file PDF
    file_path = "#{Rails.root}/public/invoices/booking_#{self.id}_invoice.pdf"
    File.open(file_path, 'wb') do |file|
      file << pdf
    end

    file_path
  end

  def save_with_payment
    sanitize_card_number

    return false unless valid?

    token = Stripe::Token.create(
      card: {
        number: card_number,
        exp_month: exp_month,
        exp_year: exp_year,
        cvc: cvc,
        name: name
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
        #application_fee_amount: (amount.to_i * 7) # Imposta l'importo della commissione per la guida (10% dell'importo della prenotazione)
      },
      #stripe_account: post.user.stripe_account_id # Imposta l'ID dell'account collegato della guida come destinatario del pagamento
    )
    
    self.stripe_charge_id = charge.id
    self.amount = amount.to_i 
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
  rescue Stripe::StripeError => e
    puts "Stripe::StripeError - Message: #{e.message}" # Capture and display Stripe error message
    errors.add :base, "Errore durante l'elaborazione del pagamento. Si prega di riprovare più tardi."
    false
  end
  
  

  private

  def sanitize_card_number
    card_number.gsub!(/\s+/, "") if card_number.present?
  end
end



