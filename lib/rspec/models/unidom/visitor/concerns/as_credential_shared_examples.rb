shared_examples 'Unidom::Visitor::Concerns::AsCredential' do |model_attributes|

  context do

    authenticating_attributes = {
      visitor_id:   SecureRandom.uuid,
      visitor_type: 'Unidom::Visitor::Visitor::Mock',
      flag_code:    Unidom::Visitor::Flag::REQUIRED.code
    }

    it_behaves_like 'has_one', model_attributes, :authenticating, Unidom::Visitor::Authenticating, authenticating_attributes

    model   = described_class.create! model_attributes
    visitor = Unidom::Visitor::User.create!
    it_behaves_like 'assert_present!', model, :authenticate!, [ visitor, at: Time.now, flag_code: 'RQRD' ], [ { 0 => :it }, :at, :flag_code ]

  end

end
