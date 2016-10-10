module Unidom::Visitor::Concerns::AsCredential

  extend ActiveSupport::Concern

  included do |includer|

    has_one :authenticating, class_name: 'Unidom::Visitor::Authenticating', as: :credential

    def authenticate!(it, at: Time.now, flag_code: 'RQRD')
      return authenticating if authenticating.present?
      create_authenticating! visitor: it, flag_code: flag_code, opened_at: at
    end

  end

  module ClassMethods
  end

end
