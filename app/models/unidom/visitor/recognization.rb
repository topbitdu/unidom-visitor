# Recognization 是访问者识别，用于维护访问者和参与者的对应关系。

class Unidom::Visitor::Recognization < ActiveRecord::Base

  self.table_name = 'unidom_recognizations'

  belongs_to :visitor, polymorphic: true
  belongs_to :party,   polymorphic: true

  scope :visitor_is,  ->(visitor) { where visitor: visitor }
  scope :party_is,    ->(party)   { where party:   party   }

  include Unidom::Common::Concerns::ModelExtension

  def self.cognize(visitor, party, elemental: true, opened_at: Time.now)
    warn "The Unidom::Visitor::Recognization.cognize method is deprecated, and will be removed since unidom-visitor v1.0. Please use the Unidom::Visitor::Recognization.cognize method instead."
    raise 'Visitor can not be null.' if visitor.blank?
    raise 'Party can not be null.'   if party.blank?
    recognization = visitor_is(visitor).party_is(party).first_or_create elemental: elemental, opened_at: opened_at
  end

  def self.cognize!(visitor, as: nil, at: Time.now, primary: false)
    query = visitor_is(visitor).party_is(as).valid_at.alive
    recognization = query.first
    if recognization.present?
      recognization.elemental = primary
      recognization.save!
      recognization
    else
      query.create! elemental: primary, opened_at: at
    end
  end

  class << self
    deprecate cognize: :cognize!, deprecator: ActiveSupport::Deprecation.new('1.0', 'unidom-visitor')
  end

end
