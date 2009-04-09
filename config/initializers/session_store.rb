# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_music_session',
  :secret      => 'e5a9c6371107454b76728f2bfdf50f9d0a2a66106111662634e6b3a12bea1e443c0641fe8e9c8eab8e76b072f32de6b932cf211439956c55ccd4b68de4d8c9e0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
