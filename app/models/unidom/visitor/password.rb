# Password 是密码。

class Unidom::Visitor::Password < ActiveRecord::Base

  has_one :authenticating, class_name: 'Unidom::Visitor::Authenticating', as: :credential

  def generate_pepper_content
    self.pepper_content = self.pepper_content||::SecureRandom.hex(self.class.columns_hash['pepper_content'].limit/2)
  end

  def clear_text
    ''
  end

  def clear_text=(password)
    generate_pepper_content
    self.hashed_content = hash password
  end

  def matched?(password)
    hash(password)==self.hashed_content
  end

  def hash(clear_text)
    Digest::SHA512.hexdigest "#{::Rails.application.secrets[:secret_key_base]}#{clear_text}#{self.pepper_content}"
  end

  def change_to(new_password)
    visitor = authenticating.visitor
    soft_destroy
    password = Password.new clear_text: new_password
    if password.save
      Authenticating.authenticate user, password
    else
      nil
    end
  end

  private :hash

end
