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

  end

end
