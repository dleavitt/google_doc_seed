# Interactively prompts for access, then retrieves a spreadsheet
# 
# Create an app here: https://console.developers.google.com
# See also: https://developers.google.com/drive/web/quickstart/quickstart-ruby
#
# Pre-reqs
# gem install launchy
# gem install google-api-client
# cp creds.example.yml creds.yml
# vim creds.yml

require '../lib/google_doc_seed'
require 'yaml'

creds = YAML.load_file('creds.yml')
token = GoogleDocSeed.get_access_token(creds['client_id'], creds['client_secret'])
seeder = GoogleDocSeed.new(token['access_token'])
puts seeder.to_csv_string(creds['doc_key'])
