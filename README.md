# Unidom Visitor 访问者领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-visitor.svg)](https://badge.fury.io/rb/unidom-visitor)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Visitor domain model engine includes User, Guest, Administrator, and Password models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。访问者领域模型引擎包括用户、游客、管理员和密码的模型。

## Usage in Gemfile
```ruby
gem 'unidom-visitor'
```

## Run the Database Migration
```shell
rake db:migrate
```

## Call the Model
```ruby
phone = PhoneNumberIdentity.create phone_number: '13912345678'
Unidom::Visitor::User.sign_up phone, 'password', now: Time.now
# Sign up a user with given phone number and password

Unidom::Visitor::Guest.valid_at.alive.first
# Get the first guest

if Unidom::Visitor::User.valid_at.alive.first.passwords.valid_at.alive.first.merge(Unidom::Visitor::Authenticating.valid_at.alive).first.matched? 'password'
  # Sign in
end
```
