require "google_doc_seed/version"
require "google_drive"
require "csv"

class GoogleDocSeed
  def initialize(token)
    @session = GoogleDrive.login_with_oauth(token)
  end

  def to_csv_string(doc_key, ws_name = nil)
    doc = @session.spreadsheet_by_key(doc_key)
    ws = ws_name ? doc.worksheet_by_title(ws_name) : doc.worksheets[0]
    CSV.generate { |csv| ws.rows.each { |row| csv << row } }
  end
end
