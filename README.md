# Unidom Visitor 访问者领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-visitor.svg)](https://badge.fury.io/rb/unidom-visitor)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Visitor domain model engine includes User, Guest, Administrator, and Password models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。访问者领域模型引擎包括用户、游客、管理员和密码的模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-visitor'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200002.

## Call the Model
```ruby
phone_1 = PhoneNumberIdentity.create phone_number: '13912345678'
Unidom::Visitor::User.sign_up phone_1, password: 'password', opened_at: Time.now
# Sign up a user with given phone number and password

phone_2 = PhoneNumberIdentity.create phone_number: '13912345679'
Unidom::Visitor::User.sign_up phone_2, opened_at: Time.now
# Sign up a user with the given phone number & password not set

Unidom::Visitor::Guest.valid_at.alive.first
# Get the first guest

if Unidom::Visitor::User.valid_at.alive.first.passwords.valid_at.alive.first.merge(Unidom::Visitor::Authenticating.valid_at.alive).first.matched? 'password'
  # Sign in
end
```

### Authenticating model
```ruby
user     = Unidom::Visitor::User.create!     opened_at: Time.now
password = Unidom::Visitor::Password.create! clear_text: 'password', opened_at: Time.now
Unidom::Visitor::Authenticating.authenticate! user, password
```

### Identificating model
```ruby
user  = Unidom::Visitor::User.create! opened_at: Time.now
email = Unidom::Contact::EmailAddress.full_address_is('name@company.com').valid_at.alive.first_or_create! opened_at: Time.now
Unidom::Visitor::Identificating.identificate! user, as: email
```
