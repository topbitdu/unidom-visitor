# Unidom Visitor

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Visitor domain model engine includes User, Guest, Administrator, and Password models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。访问者领域模型引擎包括用户、游客、管理员和密码的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-visitor'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::Visitor::User.valid_at.alive.first
Unidom::Visitor::Guest.valid_at.alive.first
Unidom::Visitor::User.valid_at.alive.first.passwords.valid_at.alive.first.merge(Unidom::Visitor::Authenticating.valid_at.alive).first
```
