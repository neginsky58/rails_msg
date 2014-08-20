class Profile < ActiveRecord::Base
  has_many :photos
  has_and_belongs_to_many :tags
  belongs_to :gmail_account
  validates :email, :uniqueness => true


  has_many :messages, -> { order 'messages.sent_date DESC'}

  STATUS = { :from_sa => 0,
             :conve_sent => 1,
             :conve_pending => 2
           }

  def main_photo
    photos.where({ main: true }).first
  end

  def messages_sent
    messages.select { |m| m.received == false }.count
  end

  def messages_received
    messages.select { |m| m.received == true }.count
  end

  def self.days_from_now date
    ((Time.parse(Time.now.strftime('%Y-%m-%d 00:00'))- Time.parse(date.strftime('%Y-%m-%d 00:00'))) / 3600 / 24).to_i
  end

end
