# Identificating 是身份关联。

class Unidom::Visitor::Identificating < ActiveRecord::Base

  self.table_name = 'unidom_identificatings'

  belongs_to :identity, polymorphic: true
  belongs_to :visitor,  polymorphic: true

  scope :identity_is, ->(identity) { where identity: identity }
  scope :visitor_is,  ->(visitor)  { where visitor:  visitor  }

end
