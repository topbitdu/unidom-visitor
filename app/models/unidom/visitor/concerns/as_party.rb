module Unidom::Visitor::Concerns::AsParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :recognizations, class_name: 'Unidom::Visitor::Recognization', as: :party

  end

  module ClassMethods
  end

end
