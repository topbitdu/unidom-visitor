module Unidom::Visitor::Concerns::AsVisitor

  extend ActiveSupport::Concern

  included do |includer|

    has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :visitor

    has_many :authenticatings, class_name: 'Unidom::Visitor::Authenticating', as: :visitor

    has_many :recognizations,  class_name: 'Unidom::Visitor::Recognization',  as: :visitor

    scope :identified_by, ->(identity) { joins(:identificatings).merge(Unidom::Visitor::Identificating.identity_is identity) }

    def is_identificated!(as: nil, at: Time.now)
      identificatings.create! identity: as, opened_at: at
    end

  end

  module ClassMethods
  end

end
