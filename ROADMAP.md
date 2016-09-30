# Unidom Visitor Roadmap 访问者领域模型引擎路线图

## v0.1
1. Identificating model & migration
2. Authenticating model & migration
3. Recognization model & migration
4. Guest model & migration
5. User model & migration
6. Password model & migration

## v0.1.1
1. Improve the Ruby Gem Specification to depend on unidom-common v0.5
2. Improve the Recognization model for table name

## v0.1.2
1. Improve the User model to fix a wrong class name in the #sign_up method

## v0.2
1. Improved the Authenticating model to add the #visitor_type_is scope & the #credential_type_is scope
2. Improved the Password model to fix a wrong class name in the #change_to method

## v0.3
1. Improved the Recognization model to support the keyword arguments in the ::cognize method
2. Improved the User model to support the keyword arguments in the ::sign_up method

## v0.4
1. Improved the User model to change the keyword arguments in the ::sign_up method
2. Improved the Authenticating model to support the keyword arguments in the ::authenticate method
3. Improved the Identificating model to support the keyword arguments in the ::identificate method

## v0.5
1. Improved the User model to support the keyword arguments for the password argument in the ::sign_up method
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.7

## v0.6
1. Improved the Password model for validation of #clear_text

## v0.7
1. Improve the Authenticating model to add the ::authenticate! method
2. Improve the Authenticating model to deprecate the ::authenticate method
3. Improve the Password model to call #generate_pepper_content before validation
4. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v0.8
1. Improve the Identificating model to add the ::identificate! method
2. Improve the Identificating model to deprecate the ::identificate method

## v0.8.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v0.8.2
1. Improve the User model for the ::sign_up method
2. Improve the Authenticating model for the ::authenticate method

## v0.9
1. Improve the Recognization model to add the ::cognize! method
2. Improve the Recognization model to deprecate the ::cognize method

## v1.0
1. Improve the Authenticating model to support the Keyword Arguments
2. Improve the Identificating model to support the Keyword Arguments
3. Improve the Recognization model to support the Keyword Arguments
4. Remove the deprecated methods

## v1.1
1. As Visitor concern
2. Improve the User model to include the As Visitor concern

## v1.2
1. As Credential concern
2. Improve the Password model to include the As Credential concern

## v1.3
1. As Identity concern

## v1.4
1. As Party concern

## v1.5
1. Improve the As Visitor concern to add the #is_identificated! method, the #is_authenticated! method, the #cognize! method, & the .sign_up! method
2. Improve the As Credential concern to add the #authenticate! method

## v1.6
1. Improve the As Identity concern to add the #identificate! method
2. Improve the As Party concern to add the #is_cognized! method
