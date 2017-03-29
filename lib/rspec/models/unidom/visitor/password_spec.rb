require 'rspec/models/unidom/visitor/concerns/as_credential_shared_examples'

describe Unidom::Visitor::Password, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      clear_text: 'password'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes
    it_behaves_like 'Unidom::Visitor::Concerns::AsCredential',  model_attributes

    it_behaves_like 'validates text', model_attributes, :clear_text,
      length: 6..200

    pepper_content_max_length = described_class.columns_hash['pepper_content'].limit
    it_behaves_like 'validates', model_attributes, :pepper_content,
      {                     } => 0,
      { pepper_content: nil } => 0,
      { pepper_content: ''  } => 2,
      { pepper_content: '1'*(pepper_content_max_length-1) } => 1,
      { pepper_content: 'A'*(pepper_content_max_length-1) } => 1,
      { pepper_content: '1'*pepper_content_max_length     } => 0,
      { pepper_content: 'A'*pepper_content_max_length     } => 0,
      { pepper_content: '1'*(pepper_content_max_length+1) } => 1,
      { pepper_content: 'A'*(pepper_content_max_length+1) } => 1

  end

end
