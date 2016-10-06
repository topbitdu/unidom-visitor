# Identificating 是身份关联，存储身份(identity)和访问者(visitor)之间的关联关系。

class Unidom::Visitor::Identificating < ActiveRecord::Base

  self.table_name = 'unidom_identificatings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :identity, polymorphic: true
  belongs_to :visitor,  polymorphic: true

  scope :identity_is, ->(identity) { where identity: identity }
  scope :visitor_is,  ->(visitor)  { where visitor:  visitor  }

  def self.find_identity(visitor)
    visitor_is(visitor).first.try :identity
  end

  def self.identificate!(visitor, as: nil, at: Time.now)
    self.visitor_is(visitor).identity_is(as).valid_at.alive.first_or_create! opened_at: at
  end

end
