require "google_doc_seed/version"
require "google_drive"
require "csv"

class GoogleDocSeed
  def self.get_access_token(client_id, client_secret)
    require 'google/api_client'
    require 'launchy'

    client = Google::APIClient.new(application_name: 'RubyGoogleDocSeed', 
                                   application_version: GoogleDocSeed::VERSION)
    
    client.authorization.client_id = client_id
    client.authorization.client_secret = client_secret
    client.authorization.redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
    client.authorization.scope = 'https://spreadsheets.google.com/feeds'
    Launchy.open(client.authorization.authorization_uri)
    puts 'Enter authorization code: '
    client.authorization.code = gets.chomp
    client.authorization.fetch_access_token!
  end

  def initialize(token)
    @session = GoogleDrive.login_with_oauth(token)
  end

  def to_csv_string(doc_key, ws_name = nil)
    doc = @session.spreadsheet_by_key(doc_key)
    ws = ws_name ? doc.worksheet_by_title(ws_name) : doc.worksheets[0]
    CSV.generate { |csv| ws.rows.each { |row| csv << row } }
  end
end
