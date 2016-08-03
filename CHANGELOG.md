# Unidom Visitor Change Log 访问者领域模型引擎变更日志

## v0.1
1. Identificating model & migration
2. Authenticating model & migration
3. Recognization model & migration
4. Guest model & migration
5. User model & migration
6. Password model & migration

## v0.1.1
1. Improved the Ruby Gem Specification to depend on unidom-common v0.5
2. Improved the Recognization model for table name

## v0.1.2
1. Improved the User model to fix a wrong class name in the #sign_up method

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
2. Improved the Ruby Gem Specification to depend on unidom-common v0.7

## v0.6
1. Improved the Password model for validation of #clear_text

## v0.7
1. Improved the Authenticating model to add the ::authenticate! method
2. Improved the Authenticating model to deprecate the ::authenticate method
3. Improved the Password model to call #generate_pepper_content before validation
4. Improved the Ruby Gem Specification to depend on unidom-common v0.9

## v0.8
1. Improved the Identificating model to add the ::identificate! method
2. Improved the Identificating model to deprecate the ::identificate method
