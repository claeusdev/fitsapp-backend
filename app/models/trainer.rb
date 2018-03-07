class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :conversations, as: :sendable
  has_many :conversations, as: :recipientable

  def self.except(trainer)
  	# all - [user]
    where.not(id: trainer.id)
    
  end

  def self.recipient_options(trainer)
  	except(trainer).map{|e| [e.email, e.id]}
  end
end
