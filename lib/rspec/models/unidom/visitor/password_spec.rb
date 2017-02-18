describe Unidom::Visitor::Password, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      clear_text: 'password'
    }

    clear_text_max_length     = 200
    pepper_content_max_length = described_class.columns_hash['pepper_content'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :clear_text,
      {                   } => 0,
      { clear_text: nil   } => 2,
      { clear_text: ''    } => 2,
      { clear_text: '1'*5 } => 1,
      { clear_text: 'A'*5 } => 1,
      { clear_text: '1'*6 } => 0,
      { clear_text: 'A'*6 } => 0,
      { clear_text: '1'*7 } => 0,
      { clear_text: 'A'*7 } => 0,
      { clear_text: '1'*(clear_text_max_length-1) } => 0,
      { clear_text: 'A'*(clear_text_max_length-1) } => 0,
      { clear_text: '1'*clear_text_max_length     } => 0,
      { clear_text: 'A'*clear_text_max_length     } => 0,
      { clear_text: '1'*(clear_text_max_length+1) } => 1,
      { clear_text: 'A'*(clear_text_max_length+1) } => 1

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
