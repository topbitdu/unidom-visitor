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

    def is_identificated?(as: nil, at: Time.now)
      query = identificatings
      query = query.identity_is as      if as.present?
      query = query.valid_at    now: at if at.present?
      query.alive.exists?
    end

    def is_authenticated!(through: nil, at: Time.now, flag_code: 'RQRD')
      if through.authenticating.present?
        through.authenticating
      else
        authenticatings.create! credential: through, opened_at: at, flag_code: flag_code
      end
    end

    def is_authenticated?(through: nil, at: Time.now, flag_code: 'RQRD')
      query = authenticatings
      query = query.credential_is through   if through.present?
      query = query.flag_coded_as flag_code if flag_code.present?
      query = query.valid_at      now: at   if at.present?
      query.alive.exists?
    end

    def cognize!(it, at: Time.now, primary: true)
      recognizations.create! party: it, elemental: primary, opened_at: at
    end

=begin
    def cognize?(it, at: Time.now, primary: true)
      query = recognizations
      query = query.party_is it      if it.present?
      query = query.primary  primary unless primary.nil?
      query = query.valid_at now: at if at.present?
      query.alive.exists?
    end
=end

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
