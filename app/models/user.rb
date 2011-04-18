class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :number
  field :dates, :type => Array


  validates_presence_of :username
  validates_presence_of :number
  validates_length_of :number, :is =>10
  validates_uniqueness_of :username, :email, :case_sensitive => false
  
  before_destroy :remove_from_caller_id
  
  attr_accessible :username, :email, :password, :password_confirmation,
                  :remember_me, :number

  def before_validation_on_create
    self.phone = phone.gsub(/[^0-9]/, "")
  end

  #
  # returns:    callerid_sid that is required to remove a number
  #
  def callerid_sid
    sid = Twilio::OutgoingCallerId.list("PhoneNumber=#{self.number}").first.last.first.last["OutgoingCallerId"]["Sid"] rescue nil
  end


  private

  def remove_from_caller_id
    Twilio::OutgoingCallerId.delete("#{self.callerid_sid}")
  end

end
