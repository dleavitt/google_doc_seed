# GoogleDocSeed

Pulls a Google Spreadsheet into a CSV string.

## Installation

Add this line to your application's Gemfile:

    gem 'google_doc_seed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_doc_seed

## Usage

Get a [[Google OAuth2 token]](https://developers.google.com/oauthplayground)
with the spreadsheet scope.


Then do this:

```ruby
require 'google_doc_seed'

seeder = GoogleDocSeed.new('your-oauth-token')
IO.write('doc.csv', seeder.to_csv_string('0Aut3k...', 'My Worksheet'))
```

## To Do

- Token retrieval
- Token renewal
- Work with the CSV rather than just a string?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
