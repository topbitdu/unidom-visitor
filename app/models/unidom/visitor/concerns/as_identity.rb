module Unidom::Visitor::Concerns::AsIdentity

  extend ActiveSupport::Concern

  included do |includer|

    has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :identity

    def identificate!(it, at: Time.now)
      identificatings.create! visitor: it, opened_at: at
    end

    def identificate?(it, at: Time.now)
      query = identificatings
      query = query.visitor_is it      if it.present?
      query = query.valid_at   now: at if at.present?
      query.alive.exists?
    end

  end

  module ClassMethods
  end

end
