# FollowUp

This gem creates follow up email templates that you can customize and automatically send to customer that you segment using standard Rails where queries.

## Installation

Add this line to your application's Gemfile:

    gem 'follow_up'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install follow_up

## Usage

1. Generate the mailer and templates, passing in the name of your user model:

    rails generate follow_up_emails User
    
2. This also generates a migration to create a table to keep track of which emails have been sent to which user. Migrate it up:

    rake db:migrate
    
3. Create a named scope called "follow_up" of the users you would like to send follow up emails to. 
In this example, we want all users that haven't yet created a new posting:

    scope :follow_up, :conditions => ["posts.count < ?", 1]
    
4. Customize the emails in views/mailers/follow_up_mailer to reference what you're following up on, for example:

"I noticed you haven't created any posts yet."
    
5. Add this line to your cron file, rake task, or wherever you want to call it from. (this sends the emails):

FollowUp.send_emails








## Config

FollowUp.desired_action = "created any posts"
FollowUp.from_email = "founder@widgets.com"
FollowUp.model_name = "User"
FollowUp.model_email_field = "email" # user.email
FollowUp.time_between_emails = "2" # in days



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
