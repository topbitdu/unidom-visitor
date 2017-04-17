shared_examples 'Unidom::Visitor::Concerns::AsIdentity' do |model_attributes|

  context do

    identificating_1_attributes = {
      visitor: Unidom::Visitor::User.create!
    }

    identificating_2_attributes = {
      visitor: Unidom::Visitor::User.create!
    }

    it_behaves_like 'has_many', model_attributes, :identificatings, Unidom::Visitor::Identificating, [ identificating_1_attributes, identificating_2_attributes ]

  end

end
