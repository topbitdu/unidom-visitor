# Authenticating 是身份鉴定，存储访问者(visitor)和信任状(credential)之间的关系。
# flag_code 有4个枚举值：RQRD (required)、SFCT (sufficient)、RQST (requisite)、OPTN (optional)。
# 各枚举值的含义见： http://docs.oracle.com/javase/8/docs/technotes/guides/security/jaas/JAASRefGuide.html 。

class Unidom::Visitor::Authenticating < ActiveRecord::Base

  self.table_name = 'unidom_authenticatings'

  belongs_to :visitor,    polymorphic: true
  belongs_to :credential, polymorphic: true

  scope :visitor_is,    ->(visitor)    { where visitor:    visitor    }
  scope :credential_is, ->(credential) { where credential: credential }

  include Unidom::Common::Concerns::ModelExtension

  def self.authenticate(visitor, credential)
    self.create! visitor: visitor, credential: credential, opened_at: Time.now
  end

end
