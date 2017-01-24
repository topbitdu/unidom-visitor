##
# Authenticating 是身份鉴定，存储访问者(visitor)和信任状(credential)之间的关系。
# flag_code 有4个枚举值：RQRD (required)、SFCT (sufficient)、RQST (requisite)、OPTN (optional)。
# 各枚举值的含义见： http://docs.oracle.com/javase/8/docs/technotes/guides/security/jaas/JAASRefGuide.html 。

class Unidom::Visitor::Authenticating < Unidom::Visitor::ApplicationRecord

  self.table_name = 'unidom_authenticatings'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  belongs_to :visitor,    polymorphic: true
  belongs_to :credential, polymorphic: true

  scope :visitor_is,    ->(visitor)    { where visitor:    visitor    }
  scope :credential_is, ->(credential) { where credential: credential }

  scope :visitor_type_is,    ->(visitor_type)    { where visitor_type:    visitor_type    }
  scope :credential_type_is, ->(credential_type) { where credential_type: credential_type }

  ##
  # 将访问者 visitor 和信任状 credential 关联起来。关联时间是 opened_at ，缺省是当前时间。如：
  # Unidom::Visitor::Authenticating.authenticate! user, with: password
  def self.authenticate!(visitor, with: nil, opened_at: Time.now)
    credential_is(with).visitor_is(visitor).valid_at.alive.first_or_create! opened_at: opened_at
  end

  code :flag, Unidom::Visitor::Flag

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Visitor::Authenticating'
