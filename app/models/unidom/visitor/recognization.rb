# Recognization 是访问者识别，用于维护访问者和参与者的对应关系。

class Unidom::Visitor::Recognization < ActiveRecord::Base

  self.table_name = 'unidom_recognizations'

  belongs_to :visitor, polymorphic: true
  belongs_to :party,   polymorphic: true

  scope :visitor_is,  ->(visitor) { where visitor: visitor }
  scope :party_is,    ->(party)   { where party:   party   }

  include Unidom::Common::Concerns::ModelExtension

  def self.cognize(visitor, party, elemental: true, opened_at: Time.now)
    raise 'Visitor can not be null.' if visitor.blank?
    raise 'Party can not be null.'   if party.blank?
    recognization = visitor_is(visitor).party_is(party).first_or_create elemental: elemental, opened_at: opened_at
  end

end
