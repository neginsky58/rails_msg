class GmailAccount < ActiveRecord::Base
  validate :email_cannot_connect
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  belongs_to :user
  has_many :profiles

  def sync_gmail
    Gmail.connect(email, password) do |gmail|
      if gmail.logged_in?
        Profile.where({ hexamail_status: 0 }).limit(5).each do |p|
          p.update_attributes({ gmail_account: self })
          gmail.inbox.emails(:from => p.email).each do |m|
            msg = Message.create({ profile_id: p.id, 
                                 received: true,
                                 subject: m.subject,
                                 sent_date: m.date,
                                 body: m.body.to_s,
                                 email_identifier: m.message.message_id
                              })
            msg.set_hexamail_status
          end
        end
      else
        update_attributes({ authenticated: false })        
      end
    end
  end

  def send_email(profile_email, subject, body)
    Gmail.connect(email, password) do |gmail|
      if gmail.logged_in?
        result = gmail.deliver do
                  to profile_email
                  subject subject
                  text_part do
                    body body
                  end
                end 
      end
    end
  end

  private
    def email_cannot_connect
      Gmail.connect(email, password) do |gmail|
        errors.add(:gmail, "can't connect") unless gmail.logged_in?
      end
    end
end