should = require 'should'
extends__ = require '../extends__'

describe 'extends__', ->
  class ParentClass
    constructor: ->
      @parent = true

    parentMethod: ->
      @calledParent = true
      return this

    parentValue: true

  class MixinOneClass
    constructor: ->
      @mixin = true

    mixinOneMethod: ->
      @calledMixinOne = true
      return this

    overlappingMethod: -> @overlappingValue = 1

    inheritedMethod: -> @superChain.push 1

    mixinOneValue: true

  class MixinTwoClass
    constructor: ->
      @mixin = true

    mixinTwoMethod: ->
      @calledMixinTwo = true
      return this

    overlappingMethod: -> @overlappingValue = 1

    inheritedMethod: -> @superChain.push 2

    mixinTwoValue: true

  class ChildClass
    extends__ ChildClass, ParentClass

    constructor: ->
      @child = true
      super

    childMethod: ->
      @calledChild = true
      return this

    childValue: true

  class MultipleChildClass
    extends__ MultipleChildClass, [ ParentClass, MixinOneClass, MixinTwoClass ]

    constructor: ->
      @superChain = []
      @multipleChild = true
      super

    multipleChildMethod: ->
      @calledMultipleChild = true
      return this

    inheritedMethod: ->
      @superChain.push 0
      super

    multipleChildValue: true

  describe 'ChildClass', ->
    describe '#constructor()', ->
      test = new ChildClass
      it 'should call child constructor', -> test.child.should.be.ok
      it 'should call parent constructor', -> test.parent.should.be.ok

    describe '#childMethod()', ->
      test = new ChildClass
      it 'should be defined', -> test.childMethod.should.be.a.Function
      it 'should set calledChild property', ->
        test.childMethod()
        test.calledChild.should.be.ok

    describe '#parentMethod()', ->
      test = new ChildClass
      it 'should be defined', -> test.parentMethod.should.be.a.Function
      it 'should set calledParent property', ->
        test.parentMethod()
        test.calledParent.should.be.ok

    describe '#childValue', ->
      test = new ChildClass
      it 'should be true', -> test.childValue.should.be.ok

    describe '#parentValue', ->
      test = new ChildClass
      it 'should be true', -> test.parentValue.should.be.ok

  describe 'MultipleChildClass', ->
    describe '#constructor()', ->
      test = new MultipleChildClass
      it 'should call multiple child constructor', -> test.multipleChild.should.be.ok
      it 'should call parent constructor', -> test.parent.should.be.ok

    describe '#multipleChildMethod()', ->
      test = new MultipleChildClass
      it 'should be defined', -> test.multipleChildMethod.should.be.a.Function
      it 'should set calledMultipleChild property', ->
        test.multipleChildMethod()
        test.calledMultipleChild.should.be.ok

    describe '#parentMethod()', ->
      test = new MultipleChildClass
      it 'should be defined', -> test.parentMethod.should.be.a.Function
      it 'should set calledParent property', ->
        test.parentMethod()
        test.calledParent.should.be.ok

    describe '#mixinOneMethod()', ->
      test = new MultipleChildClass
      it 'should be defined', -> test.mixinOneMethod.should.be.a.Function
      it 'should set calledMixinOne property', ->
        test.mixinOneMethod()
        test.calledMixinOne.should.be.ok

    describe '#mixinTwoMethod()', ->
      test = new MultipleChildClass
      it 'should be defined', -> test.mixinTwoMethod.should.be.a.Function
      it 'should set calledMixinTwo property', ->
        test.mixinTwoMethod()
        test.calledMixinTwo.should.be.ok

    describe '#ineritedMethod()', ->
      test = new MultipleChildClass
      it 'should be defined', -> test.inheritedMethod.should.be.a.Function
      it 'should update the superChain array', ->
        test.inheritedMethod()
        test.superChain.length.should.be.equal 2

      it 'should call MultipleChildClass#inheritedMethod()', -> test.superChain[0].should.be.equal 0
      it 'should call MixinTwoClass#inheritedMethod()', -> test.superChain[1].should.be.equal 2

    describe '#multipleChildValue', ->
      test = new MultipleChildClass
      it 'should be true', -> test.multipleChildValue.should.be.ok

    describe '#parentValue', ->
      test = new MultipleChildClass
      it 'should be true', -> test.parentValue.should.be.ok

    describe '#mixinOneValue', ->
      test = new MultipleChildClass
      it 'should be true', -> test.mixinOneValue.should.be.ok

    describe '#mixinTwoValue', ->
      test = new MultipleChildClass
      it 'should be true', -> test.mixinTwoValue.should.be.ok


