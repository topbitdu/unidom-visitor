module Unidom::Visitor::Concerns::AsIdentity

  extend ActiveSupport::Concern

  included do |includer|

    has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :identity

    def identificate!(it, at: Time.now)
      identificatings.create! visitor: it, opened_at: at
    end

  end

  module ClassMethods
  end

end
