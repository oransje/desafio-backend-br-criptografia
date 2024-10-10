# Cryptography challenge ruby version

Cryptographic api demonstration, using password cryptography approach.

## Setup

This project is based on sqlite3, so it must be installed on your machine(default for unix systems).

The password are stored in a configuration file called `config/crypto_password.yml`. For this application I used the `SecureRandom.base64 256` to generate a password, but you can use anything.

Then proceed to the project setup:

1. `$ bundle install`.
2. `$ bundle exec rails db:migrate`

## Running

Execute `bundle exec rails s`, and the application will listen on localhost at the port `3000`.

It is a simple crud for `crypto_datum`, so all the crud operations can be done on localhost, port `3000`.

This project can also be ran with the console, by calling the activerecord directly with `bundle exec rails c`.
