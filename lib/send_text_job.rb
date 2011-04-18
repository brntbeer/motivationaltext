class SendTextJob < Struct.new(:text, :number)

  attr_accessor :send_time

  #create Twilio object for sending the sms message here
  def send_text
    Rails.logger.info "Sending \"#{text}\" to #{number}..."
    Twilio::Sms.message(TWILIO_CONFIG['caller_id'], number, text)
  end
  handle_asynchronously :send_text, :run_at => Proc.new { |i| i.send_time }
end
