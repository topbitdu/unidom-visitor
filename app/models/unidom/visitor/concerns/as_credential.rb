module Unidom::Visitor::Concerns::AsCredential

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_one :authenticating, class_name: 'Unidom::Visitor::Authenticating', as: :credential

    def authenticate!(it, at: Time.now, flag_code: 'RQRD')

      assert_present! :it,        it
      assert_present! :at,        at
      assert_present! :flag_code, flag_code

      return authenticating if authenticating.present?
      create_authenticating! visitor: it, flag_code: flag_code, opened_at: at

    end

    def authenticate?(it, at: Time.now, flag_code: 'RQRD')

      return false if authenticating.blank?
      result = true
      result &&= it==authenticating.visitor                                 if it.present?
      result &&= at<=authenticating.closed_at&&at>=authenticating.opened_at if at.present?
      result &&= flag_code==authenticating.flag_code                        if flag_code.present?
      result

    end

  end

  module ClassMethods
  end

end
