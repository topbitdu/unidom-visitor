module Unidom::Visitor::Concerns::AsParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :recognizations, class_name: 'Unidom::Visitor::Recognization', as: :party

    def is_cognized!(via: nil, at: Time.now, primary: true)
      recognizations.create! visitor: via, elemental: primary, opened_at: at
    end

    def is_cognized?(via: nil, at: Time.now, primary: true)
      query = recognizations
      query = query.visitor_is via     if     via.present?
      query = query.primary    primary unless primary.nil?
      query = query.valid_at   now: at if     at.present?
      query = query.alive.exists?
    end

  end

  module ClassMethods
  end

end
