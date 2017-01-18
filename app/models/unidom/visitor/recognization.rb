##
# Recognization 是访问者识别，用于维护访问者和参与者的对应关系。

class Unidom::Visitor::Recognization < Unidom::Visitor::ApplicationRecord

  self.table_name = 'unidom_recognizations'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :visitor, polymorphic: true
  belongs_to :party,   polymorphic: true

  scope :visitor_is,  ->(visitor) { where visitor: visitor }
  scope :party_is,    ->(party)   { where party:   party   }

  ##
  # 将访问者 visitor 和参与者 party 关联起来。关联时间为 at ，缺省为当前时间。主关联标志为 primary ，缺省为 false 。如：
  # Unidom::Visitor::Recognization.cognize! user, as: selected_person
  def self.cognize!(visitor, as: nil, at: Time.now, primary: false)
    query = visitor_is(visitor).party_is(as).valid_at.alive
    recognization = query.first
    if recognization.present?
      recognization.elemental = primary
      recognization.save!
      recognization
    else
      query.create! elemental: primary, opened_at: at
    end
  end

end
