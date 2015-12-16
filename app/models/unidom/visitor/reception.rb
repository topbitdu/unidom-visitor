# Reception 是访问者识别，用于维护访问者和参与者的对应关系。

class Unidom::Visitor::Reception < ActiveRecord::Base

  belongs_to :visitor, polymorphic: true
  belongs_to :party,   polymorphic: true

  scope :visitor_is,  ->(visitor) { where visitor: visitor }
  scope :party_is,    ->(party)   { where party:   party   }

end
