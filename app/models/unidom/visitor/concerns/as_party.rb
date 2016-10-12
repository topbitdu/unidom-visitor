module Unidom::Visitor::Concerns::AsParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :recognizations, class_name: 'Unidom::Visitor::Recognization', as: :party

    def is_cognized!(via: nil, at: Time.now, primary: true)
      recognizations.create! visitor: via, elemental: primary, opened_at: at
    end

  end

  module ClassMethods
  end

end
