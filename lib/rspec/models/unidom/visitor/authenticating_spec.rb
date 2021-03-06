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

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :flag, Unidom::Visitor::Flag

    user_attributes     = {}
    guest_attributes    = { platform_code: 'SITE', platform_specific_identification: '123456789012' }
    password_attributes = { clear_text: 'password' }

    it_behaves_like 'belongs_to', model_attributes, :visitor,    Unidom::Visitor::User,     user_attributes
    it_behaves_like 'belongs_to', model_attributes, :visitor,    Unidom::Visitor::Guest,    guest_attributes
    it_behaves_like 'belongs_to', model_attributes, :credential, Unidom::Visitor::Password, password_attributes

    it_behaves_like 'polymorphic scope', model_attributes, :visitor_is,    :visitor,    [ Unidom::Visitor::User, Unidom::Visitor::Guest ]
    it_behaves_like 'polymorphic scope', model_attributes, :credential_is, :credential, [ Unidom::Visitor::Password                     ]

    visitor  = Unidom::Visitor::User.create!     user_attributes
    password = Unidom::Visitor::Password.create! password_attributes
    it_behaves_like 'assert_present!', described_class, :authenticate!, [ visitor, { with: password, opened_at: Time.now } ], [ { 0 => :visitor }, :with, :opened_at ]

  end

end
