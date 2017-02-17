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

    platform_specific_identification_max_length = described_class.columns_hash['platform_specific_identification'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :platform_specific_identification,
      {                                         } => 0,
      { platform_specific_identification: nil   } => 2,
      { platform_specific_identification: ''    } => 2,
      { platform_specific_identification: '1'   } => 1,
      { platform_specific_identification: 'A'   } => 1,
      { platform_specific_identification: '11'  } => 0,
      { platform_specific_identification: 'AA'  } => 0,
      { platform_specific_identification: '111' } => 0,
      { platform_specific_identification: 'AAA' } => 0,
      { platform_specific_identification: '1'*(platform_specific_identification_max_length-1) } => 0,
      { platform_specific_identification: 'A'*(platform_specific_identification_max_length-1) } => 0,
      { platform_specific_identification: '1'*platform_specific_identification_max_length     } => 0,
      { platform_specific_identification: 'A'*platform_specific_identification_max_length     } => 0,
      { platform_specific_identification: '1'*(platform_specific_identification_max_length+1) } => 1,
      { platform_specific_identification: 'A'*(platform_specific_identification_max_length+1) } => 1

  end

end
