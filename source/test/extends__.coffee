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

  class ChildClass
    extends__ ChildClass, ParentClass

    constructor: ->
      @child = true
      super

    childMethod: ->
      @calledChild = true
      return this

    childValue: true

  describe 'ChildClass', ->
    describe '#constructor()', ->
      test = new ChildClass
      it 'should call child constructor', -> test.child.should.be.ok
      it 'should call parent constructor', -> test.parent.should.be.ok

    describe '#childMethod()', ->
      test = new ChildClass
      it 'should be defined', -> test.childMethod.should.be.an.instanceof Function
      it 'should set calledChild property', ->
        test.childMethod()
        test.calledChild.should.be.ok

    describe '#parentMethod()', ->
      test = new ChildClass
      it 'should be defined', -> test.parentMethod.should.be.an.instanceof Function
      it 'should set calledParent property', ->
        test.parentMethod()
        test.calledParent.should.be.ok

    describe '#childValue', ->
      test = new ChildClass
      it 'should be true', -> test.childValue.should.be.ok

    describe '#parentValue', ->
      test = new ChildClass
      it 'should be true', -> test.parentValue.should.be.ok


