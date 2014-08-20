class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :gmail_accounts
  has_many :default_messages

  after_create :add_default_messages


  private

  def add_default_messages
    (0..7).each do |lang|
      DefaultMessage.create({ language: lang,
                              hexamail_status: 0,
                              message: '',
                              user_id: self.id
                           })
      DefaultMessage.create({ language: lang,
                              hexamail_status: 2,
                              message: '',
                              user_id: self.id
                           })
    end
  end

end
