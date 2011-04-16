class SendTextJob < Struct.new(:text, :number)

  attr_accessor :send_time

  def send_text
    Rails.logger.info "Sending #{text} to #{number}..."
    #create Twilio object for sending the sms message here
  end
  handle_asynchronously :send_text, :run_at => Proc.new { |i| i.send_time }
end
