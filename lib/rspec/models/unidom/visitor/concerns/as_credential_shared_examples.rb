shared_examples 'Unidom::Visitor::Concerns::AsCredential' do |model_attributes|

  context do

    authenticating_attributes = {
      visitor_id:   SecureRandom.uuid,
      visitor_type: 'Unidom::Visitor::Visitor::Mock',
      flag_code:    Unidom::Visitor::Flag::REQUIRED.code
    }

    it_behaves_like 'has_one', model_attributes, :authenticating, Unidom::Visitor::Authenticating, authenticating_attributes

  end

end
