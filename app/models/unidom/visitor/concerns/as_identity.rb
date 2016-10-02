module Unidom::Visitor::Concerns::AsIdentity

  extend ActiveSupport::Concern

  included do |includer|

    has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :identity

  end

  module ClassMethods
  end

end
