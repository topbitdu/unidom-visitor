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

  end

end
