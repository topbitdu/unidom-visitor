# User 是系统用户。

class Unidom::Visitor::User < ActiveRecord::Base

  self.table_name = 'unidom_users'

  has_many :identificatings, class_name: 'Unidom::Visitor::Identificating', as: :visitor

  has_many :authenticatings, class_name: 'Unidom::Visitor::Authenticating', as: :visitor
  has_many :passwords,       through:    :authenticatings, source: :credential, source_type: 'Unidom::Visitor::Password'

  has_many :recognizations,  class_name: 'Unidom::Visitor::Recognization',  as: :visitor

  scope :identified_by, ->(identity) { joins(:identificatings).merge(Unidom::Visitor::Identificating.identity_is identity) }

  include Unidom::Common::Concerns::ModelExtension

  def self.sign_up(identity, password: nil, opened_at: Time.now)

    Rails.logger.debug "Signing up user with identity: #{identity.inspect}."
    return false if identified_by(identity).valid_at.alive.merge(Unidom::Visitor::Identificating.valid_at.alive).count>0

    user           = create! opened_at: opened_at
    identificating = Unidom::Visitor::Identificating.identificate! user, as: identity

    Rails.logger.debug "Authenticate user #{user.id} with password: #{password.inspect}."
    if password.present?
      credential     = Unidom::Visitor::Password.create! clear_text: password, opened_at: opened_at
      authenticating = Unidom::Visitor::Authenticating.authenticate! user, credential
    end

    user

  end

end
