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

    def is_authenticated!(through: nil, at: Time.now, flag_code: 'RQRD')
      if through.authenticating.present?
        through.authenticating
      else
        authenticatings.create! credential: through, opened_at: at, flag_code: flag_code
      end
    end

    def cognize!(it, at: Time.now, primary: true)
      recognizations.create! party: it, elemental: primary, opened_at: at
    end

  end

  module ClassMethods

    def sign_up!(it, as: nil, through: nil, at: Time.now, flag_code: 'RQRD', primary: true)
      user = create! opened_at: at
      user.cognize! it,      primary: true,    at: at
      user.is_identificated! as:      as,      at: at
      user.is_authenticated! through: through, at: at
      user
    end

  end

end
