describe Unidom::Visitor::Flag, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 4, [
    { code: 'RQRD', name: 'required',   localized_name: '必须的' },
    { code: 'SFCT', name: 'sufficient', localized_name: '必要的' },
    { code: 'RQST', name: 'requisite',  localized_name: '足够的' },
    { code: 'OPTN', name: 'optional',   localized_name: '可选的' } ]

end
