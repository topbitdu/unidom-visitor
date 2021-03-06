# Unidom Visitor 访问者领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-visitor/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-visitor.svg)](https://badge.fury.io/rb/unidom-visitor)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-visitor.svg)](https://gemnasium.com/github.com/topbitdu/unidom-visitor)

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
Unidom::Visitor::Authenticating.authenticate! user, with: password
```

### Identificating model

```ruby
user  = Unidom::Visitor::User.create! opened_at: Time.now
email = Unidom::Contact::EmailAddress.full_address_is('name@company.com').valid_at.alive.first_or_create! opened_at: Time.now
Unidom::Visitor::Identificating.identificate! user, as: email
```

### Recognization model

```ruby
user   = Unidom::Visitor::User.create! opened_at: Time.now
person = Unidom::Party::Person.create! name: 'Tim', opened_at: Time.now
Unidom::Visitor::Recognization.cognize! user, as: person
```



## Inlcude the Concerns

```ruby
include Unidom::Visitor::Concerns::AsVisitor
include Unidom::Visitor::Concerns::AsIdentity
include Unidom::Visitor::Concerns::AsCredential
include Unidom::Visitor::Concerns::AsParty
```

### As Visitor concern

The As Visitor concern do the following tasks for the includer automatically:
1. Define the has_many :identificatings macro as: ``has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :visitor``
2. Define the has_many :authenticatings macro as: ``has_many :authenticatings, class_name: 'Unidom::Visitor::Authenticating', as: :visitor``
3. Define the has_many :recognizations macro as: ``has_many :recognizations, class_name: 'Unidom::Visitor::Recognization', as: :visitor``
4. Define the .identified_by scope as: ``scope :identified_by, ->(identity) { joins(:identificatings).merge(Unidom::Visitor::Identificating.identity_is identity) }``
5. Define the .sign_up method as: ``sign_up(identity, password: nil, opened_at: Time.now)``
6. Define the #is_identificated! method as: ``is_identificated!(as: nil, at: Time.now)``
7. Define the #is_identificated? method as: ``is_identificated?(as: nil, at: Time.now)``
8. Define the #is_authenticated! method as: ``is_authenticated!(through: nil, at: Time.now, flag_code: 'RQRD')``
9. Define the #is_authenticated? method as: ``is_authenticated?(through: nil, at: Time.now, flag_code: 'RQRD')``
10. Define the #cognize! method as: ``cognize!(it, at: Time.now, primary: true)``
11. Define the #cognize? method as: ``cognize?(it, at: Time.now, primary: true)``
12. Define the .sign_up! method as: ``sign_up!(it, as: nil, through: nil, at: Time.now, flag_code: 'RQRD', primary: true)``

### As Identity concern

The As Identity concern do the following tasks for the includer automatically:
1. Define the has_many :identificatings macro as: ``has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :identity``
2. Define the #identificate! method as: ``identificate!(it, at: Time.now)``
3. Define the #identificate? method as: ``identificate?(it, at: Time.now)``

### As Credential concern

The As Credential concern do the following tasks for the includer automatically:
1. Define the has_one :authenticatings macro as: ``has_one :authenticating, class_name: 'Unidom::Visitor::Authenticating', as: :credential``
2. Define the #authenticate! method as: ``authenticate!(it, at: Time.now, flag_code: 'RQRD')``
3. Define the #authenticate? method as: ``authenticate?(it, at: Time.now, flag_code: 'RQRD')``

### As Party concern

The As Party concern do the following tasks for the includer automatically:
1. Define the has_many :recognizations macro as: ``has_many :recognizations, class_name: 'Unidom::Visitor::Recognization', as: :party``
2. Define the #is_cognized! method as: ``is_cognized!(via: nil, at: Time.now, primary: true)``
3. Define the #is_cognized? method as: ``is_cognized!(via: nil, at: Time.now, primary: true)``



## Enum codes

### Flag enum code

```ruby
# http://docs.oracle.com/javase/8/docs/technotes/guides/security/jaas/JAASRefGuide.html
Unidom::Visitor::Flag::REQUIRED
Unidom::Visitor::Flag::SUFFICIENT
Unidom::Visitor::Flag::REQUISITE
Unidom::Visitor::Flag::OPTIONAL
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Visitor
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/visitor/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/visitor/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/visitor/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# The Unidom::Visitor::Password model already include the Unidom::Visitor::Concerns::AsCredential concern

# lib/unidom.rb
Unidom::Contact::EmailAddress.class_eval do

  include Unidom::Visitor::Concerns::AsIdentity

end

# app/models/your_credential.rb
class YourCredential < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Visitor::Concerns::AsCredential

end

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/visitor/rspec_shared_examples'

# spec/models/your_credential_spec.rb
describe YourCredential, type: :model do

  model_attribtues = {
    your_attribute: 'your value'
  }

  it_behaves_like 'Unidom::Visitor::Concerns::AsCredential', model_attribtues

end

# spec/models/unidom/contact/email_address_spec.rb
describe Unidom::Contact::EmailAddress, type: :model do

  context do

    model_attribtues = {
      full_address: "#{SecureRandom.hex 16}@#{SecureRandom.hex 8}.com"
    }

    it_behaves_like 'Unidom::Visitor::Concerns::AsIdentity', model_attribtues

  end

end
```
