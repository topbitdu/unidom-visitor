describe Unidom::Visitor::Authenticating, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      visitor_id:      SecureRandom.uuid,
      visitor_type:    'Unidom::Visitor::Visitor::Mock',
      credential_id:   SecureRandom.uuid,
      credential_type: 'Unidom::Visitor::Credential::Mock',
      flag_code:       Unidom::Visitor::Flag::REQUIRED.code
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
