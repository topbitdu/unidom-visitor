##
# Password 是密码。

class Unidom::Visitor::Password < Unidom::Visitor::ApplicationRecord

  self.table_name = 'unidom_passwords'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Visitor::Concerns::AsCredential

  validates :clear_text,     presence: true, length: { in: 6..200 }
  validates :pepper_content, presence: true, length: { is: columns_hash['pepper_content'].limit }

  before_validation :generate_pepper_content

  def generate_pepper_content
    self.pepper_content = self.pepper_content||SecureRandom.hex(self.class.columns_hash['pepper_content'].limit/2)
  end

  def clear_text
    @clear_text
  end

  def clear_text=(password)
    @clear_text = password
    generate_pepper_content
    self.hashed_content = hash password
  end

  def matched?(password)
    hash(password)==self.hashed_content
  end

  def hash(clear_text)
    Digest::SHA512.hexdigest "#{::Rails.application.secrets[:secret_key_base]}#{clear_text}#{self.pepper_content}"
  end

  ##
  # 将当前密码更换为指定的新密码。如：
  # password.change_to 'newpassword'
  def change_to(new_password)
    visitor = authenticating.visitor
    soft_destroy
    authenticating.soft_destroy
    password = self.class.new clear_text: new_password, opened_at: Time.now
    if password.save
      #Unidom::Visitor::Authenticating.authenticate visitor, password
      Unidom::Visitor::Authenticating.authenticate! visitor, with: password
    else
      nil
    end
  end

  private :hash

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Visitor::Password'
