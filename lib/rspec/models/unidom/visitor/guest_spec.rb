describe Unidom::Visitor::Guest, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      platform_code:                    'SITE',
      platform_specific_identification: '123456789012'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
