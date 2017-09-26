class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :recieved_messages, class_name: "Message", foreign_key: "recipient_id"
  # Removing current User from list of possible recipients.
  def self.except(user)
  	# all - [user]
  	where.not(id: user.id)
  end

  def self.recipient_options(user)
  	except(user).map{|e| [e.email, e.id]}
  end
end
