# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_melhor_ilhabela_session',
  :secret      => 'dc75d1147f15edcff34b9e5d07e676c195b31b95732b631cdb331a6198401efba094607e125506a13dbc22bce72d65a8f964d7a535c5542f24594130104da939'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
