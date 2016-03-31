coffeelint = require 'coffeelint'
assert = require 'power-assert'
NoAccessorExistentialOperator = require '../src/no_accessor_existential_operator'

describe 'no_accessor_existential_operator', ->
  config = no_accessor_existential_operator:
             level: 'error'

  beforeEach ->
    coffeelint.registerRule NoAccessorExistentialOperator
  
  it 'should warn when hoge?.fuga', ->
    assert(coffeelint.lint('hoge?.fuga', config).length == 1)

  it 'should warn when hoge?().fuga', ->
    assert(coffeelint.lint('hoge?().fuga', config).length == 1)

  it 'should not warn when hoge?', ->
    assert(coffeelint.lint('hoge?', config).length == 0)
    
  it 'should not warn when hoge ?= 15', ->
    assert(coffeelint.lint('hoge ?= 15', config).length == 0)
  
  it 'should not warn when hoge = fuga ? "piyo"', ->
    assert(coffeelint.lint('hoge = fuga ? "piyo"', config).length == 0)
