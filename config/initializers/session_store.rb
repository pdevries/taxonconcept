# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_taxonconcept_session',
  :secret      => 'd1a681e3c53b07fcc0ac5cce0bef453e23221d82aa22f5bf3608473906606c0a86775907283f638d43262aadd7123ceafd97aeb40d0bb16cebdf857544d8c16b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
