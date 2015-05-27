module.exports = (ChildClass, ParentClasses) ->
  if ParentClasses instanceof Array and ParentClasses.length
    class ParentClass extends ParentClasses.shift()
      constructor: ->
        super
        for MixinClass in ParentClasses
          MixinClass.apply this, arguments

    for MixinClass in ParentClasses
      for own key, value of MixinClass::
        ParentClass::[key] = value unless key is 'constructor'
  else
    ParentClass = ParentClasses

  return ChildClass extends ParentClass
