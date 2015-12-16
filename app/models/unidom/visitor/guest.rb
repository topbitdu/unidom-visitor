# Guest 是系统访客。

class Unidom::Visitor::Guest < ActiveRecord::Base

  self.table_name = 'unidom_guests'

  validates :platform_specific_identification, presence: true, length: { in: 2..self.columns_hash['platform_specific_identification'].limit }

  scope :platform_specific_identification_is, ->(platform_specific_identification) { where platform_specific_identification: platform_specific_identification }

end
