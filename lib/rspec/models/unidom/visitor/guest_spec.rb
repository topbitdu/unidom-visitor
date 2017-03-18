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

    it_behaves_like 'validates text', model_attributes, :platform_specific_identification,
      length: 2..described_class.columns_hash['platform_specific_identification'].limit

    new_platform_specific_identification = 'ABCDEFGHIJKLMNOP'
    it_behaves_like 'scope', :platform_specific_identification_is, [
      { attributes_collection: [ model_attributes                                                                               ], count_diff: 1, args: [ model_attributes[:platform_specific_identification] ] },
      { attributes_collection: [ model_attributes                                                                               ], count_diff: 0, args: [ new_platform_specific_identification                ] },
      { attributes_collection: [ model_attributes.merge(platform_specific_identification: new_platform_specific_identification) ], count_diff: 0, args: [ model_attributes[:platform_specific_identification] ] },
      { attributes_collection: [ model_attributes.merge(platform_specific_identification: new_platform_specific_identification) ], count_diff: 1, args: [ new_platform_specific_identification                ] },
    ]

  end

end
