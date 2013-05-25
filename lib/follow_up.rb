require "follow_up/version"

module FollowUp
  
  EMAIL_INTERVAL = 2
  
  scope :trial_users, lambda { where("created_at >= ?", DateTime.now - 21.days ) }
  
  
  def send_follow_up_emails
    users = User.follow_up.where("created_at <= ?", DateTime.now - (EMAIL_INTERVAL * 3).days)
    users.each do |user|
      follow_up = find_or_create_follow_up(user)
      if valid_user?(follow_up)
        email = determine_email(follow_up)
        update_emails_sent(follow_up)
        send_email(email, user)
      end
  end
  
  def update_emails_sent(follow_up)
    follow_up.emails_sent += 1
    follow_up.sent_at = Time.now
    follow_up.save
  end
  
  def valid_user?(follow_up)
    #we also don't want to send the first email for 2 days - need to figure this out
    follow_up.emails_sent < 2  && (Date.today - follow_up.sent_at).to_i > EMAIL_INTERVAL && recent_user?
  end
  
  def find_or_create_follow_up(user)
    FollowUp.find_or_create_by_user_id(user.id)
  end
  
  def determine_email(follow_up)
    case follow_up.emails_sent
    when 0 
      email_1
    when 1 
      email_2
    end
  end
  
  def send_email(email, user)
    FollowUpMailer.email(user).deliver
    puts "send #{email} to #{user}"
  end
end


