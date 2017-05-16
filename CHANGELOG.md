# Unidom Visitor Change Log 访问者领域模型引擎变更日志

## v0.1
1. Identificating model & migration (20000201000000)
2. Authenticating model & migration (20000202000000)
3. Recognization model & migration (20000203000000)
4. Guest model & migration (20000210000000)
5. User model & migration (20000211000000)
6. Password model & migration (20000220000000)

## v0.1.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.5
2. Improved the Recognization model for table name

## v0.1.2
1. Improved the User model to fix a wrong class name in the .``sign_up`` method

## v0.2
1. Improved the Authenticating model to add the ``visitor_type_is`` scope & the #credential_type_is scope
2. Improved the Password model to fix a wrong class name in the #``change_to`` method

## v0.3
1. Improved the Recognization model to support the keyword arguments in the .``cognize`` method
2. Improved the User model to support the keyword arguments in the .``sign_up`` method

## v0.4
1. Improved the User model to change the keyword arguments in the .``sign_up`` method
2. Improved the Authenticating model to support the keyword arguments in the ::authenticate method
3. Improved the Identificating model to support the keyword arguments in the ::identificate method

## v0.5
1. Improved the User model to support the keyword arguments for the password argument in the ::sign_up method
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.7

## v0.6
1. Improved the Password model for validation of #clear_text

## v0.7
1. Improved the Authenticating model to add the ::authenticate! method
2. Improved the Authenticating model to deprecate the ::authenticate method
3. Improved the Password model to call #generate_pepper_content before validation
4. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v0.8
1. Improved the Identificating model to add the ::identificate! method
2. Improved the Identificating model to deprecate the ::identificate method

## v0.8.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v0.8.2
1. Improved the User model for the ::sign_up method
2. Improved the Authenticating model for the ::authenticate method

## v0.9
1. Improved the Recognization model to add the ::cognize! method
2. Improved the Recognization model to deprecate the ::cognize method

## v1.0
1. Improved the Authenticating model to support the Keyword Arguments
2. Improved the Identificating model to support the Keyword Arguments
3. Improved the Recognization model to support the Keyword Arguments
4. Removed the deprecated methods

## v1.1
1. As Visitor concern
2. Improved the User model to include the As Visitor concern

## v1.2
1. As Credential concern
2. Improved the Password model to include the As Credential concern

## v1.3
1. As Identity concern

## v1.4
1. As Party concern

## v1.5
1. Improved the As Identity concern to add the #identificate! method
2. Improved the As Visitor concern to add the #is_identificated! method

## v1.6
1. Improved the As Credential concern to add the #authenticate! method
2. Improved the As Visitor concern to add the #is_authenticated! method

## v1.7
1. Improved the As Visitor concern to add the #cognize! method
2. Improved the As Party concern to add the #is_cognized! method

## v1.8
1. Improved the As Visitor concern to add the .sign_up! method

## v1.9
1. Improved the As Identity concern to add the #identificate? method
2. Improved the As Visitor concern to add the #is_identificated? method

## v1.10
1. Improved the As Credential concern to add the #authenticate? method
2. Improved the As Visitor concern to add the #is_authenticated? method

## v1.11
1. Improved the As Visitor concern to add the #cognize? method
2. Improved the As Party concern to add the #is_cognized? method

## v1.11.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.11.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.12
1. Flag enum code
2. Improve the Authenticating model to configure the Flag enum code

## v1.12.1
1. Improve the Password model for the #change_to method

## v1.12.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.12.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v1.12.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.13
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.13.1
1. Improve the Authenticating spec for the validations on the #flag_code attribute
2. Improve the Guest spec for the validations on the #platform_specific_identification attribute
3. Improve the Password spec for the validations on the #clear_text attribute, & the #pepper_content attribute

## v1.13.2
1. Improve the Authenticating spec for the ``belongs_to :visitor, polymorphic: true`` macro, & the ``belongs_to :credential, polymorphic: true`` macro
2. Improve the Identificating spec for the ``belongs_to :visitor, polymorphic: true`` macro

## v1.13.3
1. Improve the Authenticating spec for the visitor_is scope, & the credential_is scope
2. Improve the Identificating spec for the visitor_is scope

## v1.13.4
1. Improve the Recognization spec for the ``belongs_to :visitor, polymorphic: true`` macro
2. Improve the Guest spec for the platform_specific_identification_is scope

## v1.13.5
1. Improve the Guest spec for the validations on the #platform_specific_identification attribute
2. Improve the Password spec for the validations on the #clear_text attribute, & the #pepper_content attribute

## v1.13.6
1. As Credential shared examples
2. RSpec shared examples manifest
3. Improve the Password spec for the As Credential concern

## v1.13.7
1. Improve the Authenticating model for the argument validations of the .authenticate! method
2. Improve the Authenticating spec for the argument validations of the .authenticate! method

## v1.13.8
1. Improve the As Credential concern for the argument validations of the #authenticate! method
2. Improve the As Credential shared examples for the argument validations of the #authenticate! method

## v1.13.9
1. As Identity shared examples
2. Improve the RSpec shared examples manifest to require the As Identity shared examples

## v1.13.10
1. Improve the Ruby Gem Specification to depend on unidom-common v1.10
2. Improve the Identificating migration, the Authenticating migration, the Recognization migration, the Guest migration, the User migration, & the Password migration for the #opened_at column, & the #closed_at column
