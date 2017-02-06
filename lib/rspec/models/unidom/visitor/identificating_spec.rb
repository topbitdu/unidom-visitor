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

  end

end
