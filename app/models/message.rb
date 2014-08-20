class Message < ActiveRecord::Base
  belongs_to :profile
  validates :subject, presence: true
  validates :body, presence: true
  validate :uniq_email_received, :on => :create
  SENT_TO = { not_sent: -1, gmail: 0, facebook: 1 }

  after_create :set_profile_last_message_date, :set_hexamail_status

  def send_to_email(gmail_account_id=nil)
    if profile.gmail_account
      profile.gmail_account.send_email(profile.email, subject, body) 
    else
      gmail_account = GmailAccount.where({ id: gmail_account_id }).first
      gmail_account.send_email(profile.email, subject, body) if gmail_account
    end
    update_attributes({ sent_date: DateTime.now })
  end

  def set_hexamail_status
    if profile.hexamail_status == Profile::STATUS[:from_sa]
      if received == true
        profile.update_attributes({ hexamail_status: Profile::STATUS[:conve_pending] })
      else
        profile.update_attributes({ hexamail_status: Profile::STATUS[:conve_sent] })
      end
    elsif profile.hexamail_status == Profile::STATUS[:conve_sent]
      if received == true
        profile.update_attributes({ hexamail_status: Profile::STATUS[:conve_pending] })
      end
    elsif profile.hexamail_status == Profile::STATUS[:conve_pending]
      if received == false
        profile.update_attributes({ hexamail_status: Profile::STATUS[:conve_sent] })
      end
    end 
  end


  def fill_from_profile_id
    u = User.find_by_email("")
    unless u.nil?
      profile_id = u.profile.id
      Message.all { |e| e.update_attributes(:from_profile_id, profile_id) }
    end
  end


  private

  def set_profile_last_message_date
    profile.update_attributes({ last_sent: profile.messages.order(sent_date: :asc).first.sent_date })
    if profile.messages.where({ received: true }).count > 0
      profile.update_attributes({ last_received: profile.messages.where({ received: true }).order(sent_date: :asc).first.sent_date })
    end
  end

  def uniq_email_received
    if received == true and Message.where({ email_identifier: email_identifier }).count != 0
      errors.add('email_identier', 'email already exist')
    end
  end

end
