##
# User 是系统用户。

class Unidom::Visitor::User < Unidom::Visitor::ApplicationRecord

  self.table_name = 'unidom_users'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Visitor::Concerns::AsVisitor

  has_many :passwords, through: :authenticatings, source: :credential, source_type: 'Unidom::Visitor::Password'

  ##
  # 注册用户。用户的登录账号是 identity ，密码是 password ，注册时间是 opened_at ，缺省为当前时间。如：
  # Unidom::Visitor::User.sign_up email, password: 'yourpassword'
  def self.sign_up(identity, password: nil, opened_at: Time.now)

    Rails.logger.debug "Signing up user with identity: #{identity.inspect}."
    return false if identified_by(identity).valid_at.alive.merge(Unidom::Visitor::Identificating.valid_at.alive).count>0

    user           = create! opened_at: opened_at
    identificating = Unidom::Visitor::Identificating.identificate! user, as: identity

    Rails.logger.debug "Authenticate user #{user.id} with password: #{password.inspect}."
    if password.present?
      credential     = Unidom::Visitor::Password.create! clear_text: password, opened_at: opened_at
      authenticating = Unidom::Visitor::Authenticating.authenticate! user, with: credential
    end

    user

  end

end
