describe Unidom::Visitor::Identificating, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      visitor_id:    SecureRandom.uuid,
      visitor_type:  'Unidom::Visitor::Visitor::Mock',
      identity_id:   SecureRandom.uuid,
      identity_type: 'Unidom::Visitor::Identity::Mock'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    user_attributes  = {}
    guest_attributes = { platform_code: 'SITE', platform_specific_identification: '123456789012' }

    it_behaves_like 'belongs_to', model_attributes, :visitor, Unidom::Visitor::User,  user_attributes
    it_behaves_like 'belongs_to', model_attributes, :visitor, Unidom::Visitor::Guest, guest_attributes

    it_behaves_like 'polymorphic scope', model_attributes, :visitor_is, :visitor, [ Unidom::Visitor::User, Unidom::Visitor::Guest ]

  end

end
