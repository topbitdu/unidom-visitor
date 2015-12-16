# Authenticating 是身份鉴定。

class Unidom::Visitor::Authenticating < ActiveRecord::Base

  self.table_name = 'unidom_authenticatings'

  belongs_to :visitor,    polymorphic: true
  belongs_to :credential, polymorphic: true

  scope :visitor_is,    ->(visitor)    { where visitor:    visitor    }
  scope :credential_is, ->(credential) { where credential: credential }

end
