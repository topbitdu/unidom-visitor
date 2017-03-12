describe Unidom::Visitor::Recognization, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      visitor_id:   SecureRandom.uuid,
      visitor_type: 'Unidom::Visitor::Visitor::Mock',
      party_id:     SecureRandom.uuid,
      party_type:   'Unidom::Visitor::Party::Mock',
      elemental:    true
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    user_attributes  = {}
    guest_attributes = { platform_code: 'SITE', platform_specific_identification: '123456789012' }

    it_behaves_like 'belongs_to', model_attributes, :visitor, Unidom::Visitor::User,  user_attributes
    it_behaves_like 'belongs_to', model_attributes, :visitor, Unidom::Visitor::Guest, guest_attributes

  end

end
