module.exports = class NoAccessorExistentialOperator
  rule:
    name: 'no_accessor_existential_operator'
    level: 'warn'
    message: 'Accessor with existential operator are forbidden'
    description: '''
      This rule prohibits accessor with existential operator.
      When coffeescript transpile to ES2015(ES6), accessor with existential operator is transpiled complex code.
      '''
  tokens: ['?.', 'FUNC_EXIST']
  lintToken: (token, tokenApi) ->
    true
