module Unidom::Visitor::Concerns::AsCredential

  extend ActiveSupport::Concern

  included do |includer|

    has_one :authenticating, class_name: 'Unidom::Visitor::Authenticating', as: :credential

  end

  module ClassMethods
  end

end
