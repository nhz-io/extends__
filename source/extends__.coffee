module.exports = (ChildClass, ParentClasses) ->
  if ParentClasses instanceof Array and ParentClasses.length
    class ParentClass extends ParentClasses.shift()
    for MixinClass in ParentClasses
      ParentClass::[key] = value for own key, value of MixinClass::
  else
    ParentClass = ParentClasses

  return ChildClass extends ParentClass
